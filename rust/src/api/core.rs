use core::panic;
use std::{ops::Range, sync::Once};

use anyhow::Ok;
use blazyr_core::{
    applications::Application, cache_apps, get_apps_from_cache, get_frequency, lookup_apps,
    lookup_commands, merge_apps_commands, set_frequency, App, FuzzyFinder,
};
pub use blazyr_core::{Component, EntityActionResponse};
use flutter_rust_bridge::{frb, DartFnFuture};
use thiserror::Error;

use crate::frb_generated::StreamSink;

static DART_STREAM_START: Once = Once::new();
static mut DART_STREAM: Option<StreamSink<DartAction>> = None;

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

#[flutter_rust_bridge::frb(opaque)]
pub struct StateApp {
    pub entities: Vec<blazyr_core::Entity<App>>,
    pub frequencies: Vec<u64>,
    pub apps_range: Range<usize>,
    pub plugins_range: Range<usize>,
}

impl StateApp {
    #[allow(clippy::new_without_default)]
    pub fn new() -> StateApp {
        let apps: Vec<App> = get_apps_from_cache();
        let commands = lookup_commands();

        let mut frequencies: Vec<u64> = apps.iter().map(|v| get_frequency(v.name())).collect();
        let mut plugins_frequencies: Vec<u64> =
            commands.iter().map(|v| get_frequency(v.name())).collect();
        frequencies.append(&mut plugins_frequencies);

        let (entities, apps_range, plugins_range) = merge_apps_commands(apps, commands);

        StateApp {
            entities,
            frequencies,
            apps_range,
            plugins_range,
        }
    }

    pub async fn execute(
        &mut self,
        id: usize,
        arg: Option<String>,
        on_executed: impl Fn() -> DartFnFuture<()>,
    ) -> Result<BlazyrEntityActionResponse, EntityError> {
        let entity = &mut self.entities[id];
        let new_frequency = self.frequencies[id] + 1;
        let result = match entity {
            blazyr_core::Entity::Application(app) => {
                set_frequency(app.name(), new_frequency);
                app.execute(arg.as_deref())
                    .map(|_| BlazyrEntityActionResponse::None)
            }
            blazyr_core::Entity::Command(command) => {
                set_frequency(command.name(), new_frequency);
                command.execute(arg.as_deref()).map(|v| v.into())
            }
        }
        .map_err(|e| EntityError::Unknown(e.to_string()));

        // TODO remove this call
        // on_executed().await;
        result
    }

    pub async fn component_clickable(
        &mut self,
        id: usize,
        action: String,
    ) -> Result<(), EntityError> {
        let entity = &mut self.entities[id];

        match entity {
            blazyr_core::Entity::Application(_) => panic!(),
            blazyr_core::Entity::Command(command) => command.component_clickable(action),
        }
        .map_err(|e| EntityError::Unknown(e.to_string()))
    }

    pub fn get_commands(&self) -> Vec<Entity> {
        let mut temp: Vec<_> = self
            .entities
            .iter()
            .enumerate()
            .filter(|(_, e)| matches!(e, blazyr_core::Entity::Command(_)))
            .collect();

        // what the fuck was I trying to do here ?
        temp.sort_by_key(|(_, e)| match e {
            blazyr_core::Entity::Application(_app) => 0,
            blazyr_core::Entity::Command(_plug) => 0,
        });

        temp.iter()
            .map(|(i, e)| {
                let (name, alias, description, icon) = match e {
                    blazyr_core::Entity::Command(plug) => {
                        (plug.name(), plug.alias(), plug.description(), plug.icon())
                    }
                    _ => panic!("An other type than a command was incountered"),
                };

                Entity {
                    index: *i,
                    name: name.to_string(),
                    alias: alias.map(|v| v.to_string()),
                    description: description.map(|v| v.to_string()),
                    icon: icon.map(|v| match v {
                        blazyr_core::Image::Data(d) => Image::Data(d),
                        blazyr_core::Image::Path(p) => Image::Path(p),
                    }),
                    r#type: "Command".to_owned(),
                }
            })
            .collect()
    }
}

#[derive(Error, Debug)]
pub enum EntityError {
    #[error("Unknown: {0}")]
    Unknown(String),
}

pub struct Entity {
    pub index: usize,
    pub name: String,
    pub alias: Option<String>,
    pub description: Option<String>,
    pub icon: Option<Image>,
    pub r#type: String,
}

pub enum Image {
    Data(Vec<u8>),
    Path(String),
}

pub fn search(obj: &StateApp, search: String) -> Vec<Entity> {
    let result = FuzzyFinder::search(&search, obj.entities.as_ref(), &obj.frequencies);
    result
        .into_iter()
        .map(|(index, _score)| {
            let ent = &obj.entities[index];

            let (name, alias, description, icon, etype) = match ent {
                blazyr_core::Entity::Command(plug) => (
                    plug.name(),
                    plug.alias(),
                    plug.description(),
                    plug.icon(),
                    "Command".to_owned(),
                ),
                blazyr_core::Entity::Application(app) => (
                    app.name(),
                    app.alias(),
                    app.description(),
                    app.icon(),
                    "Application".to_owned(),
                ),
            };

            Entity {
                index,
                name: name.to_string(),
                alias: alias.map(|v| v.to_string()),
                description: description.map(|v| v.to_string()),
                icon: icon.map(|v| match v {
                    blazyr_core::Image::Data(d) => Image::Data(d),
                    blazyr_core::Image::Path(p) => Image::Path(p),
                }),
                r#type: etype,
            }
        })
        .collect()
}

pub enum DartAction {
    Exit,
}

pub fn set_dart_action_stream(sink: StreamSink<DartAction>) -> anyhow::Result<()> {
    unsafe {
        DART_STREAM_START.call_once(|| {
            DART_STREAM = Some(sink);
        });
    }
    Ok(())
}

pub fn on_exit() {
    let apps = lookup_apps();
    cache_apps(&apps);
}

pub enum BlazyrEntityActionResponse {
    Ui(BlazyrComponent),
    Text(String),
    None,
}

impl From<EntityActionResponse> for BlazyrEntityActionResponse {
    fn from(value: EntityActionResponse) -> Self {
        match value {
            EntityActionResponse::Ui(component) => BlazyrEntityActionResponse::Ui(component.into()),
            EntityActionResponse::Text(text) => BlazyrEntityActionResponse::Text(text),
            EntityActionResponse::None => BlazyrEntityActionResponse::None,
        }
    }
}

pub enum BlazyrComponent {
    Container {
        child: Option<Box<BlazyrComponent>>,
    },
    Column {
        children: Option<Vec<BlazyrComponent>>,
    },
    Row {
        children: Option<Vec<BlazyrComponent>>,
    },
    Clickable {
        child: Option<Box<BlazyrComponent>>,
        on_click: Option<String>,
    },
}

impl From<Component> for BlazyrComponent {
    fn from(value: Component) -> Self {
        match value {
            Component::Container { child } => BlazyrComponent::Container {
                child: child.map(|v| Box::new(BlazyrComponent::from(*v))),
            },
            Component::Column { children } => BlazyrComponent::Column {
                children: children.map(|v| v.into_iter().map(BlazyrComponent::from).collect()),
            },
            Component::Row { children } => BlazyrComponent::Row {
                children: children.map(|v| v.into_iter().map(BlazyrComponent::from).collect()),
            },
            Component::Clickable { on_click, child } => BlazyrComponent::Clickable {
                child: child.map(|v| Box::new(BlazyrComponent::from(*v))),
                on_click,
            },
        }
    }
}
