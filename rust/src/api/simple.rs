use core::panic;

use blazyr_core::{get_entities, FuzzyFinder};
use flutter_rust_bridge::DartFnFuture;
use thiserror::Error;

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

#[flutter_rust_bridge::frb(opaque)]
pub struct StateApp {
    pub entities: Vec<blazyr_core::Entity>,
}

impl StateApp {
    #[allow(clippy::new_without_default)]
    pub fn new() -> StateApp {
        StateApp {
            entities: get_entities(),
        }
    }

    pub async fn execute(
        &mut self,
        id: usize,
        arg: Option<String>,
        on_executed: impl Fn() -> DartFnFuture<()>,
    ) -> Result<(), EntityError> {
        let entity = &mut self.entities[id];
        let result = match entity {
            blazyr_core::Entity::Application(app) => app.execute(arg.as_deref()),
            blazyr_core::Entity::Command(plug) => plug.execute(arg.as_deref()),
        }
        .map_err(|e| EntityError::Unknown(e.to_string()));

        on_executed().await;
        result
    }

    pub fn get_commands(&self) -> Vec<Entity> {
        let mut temp: Vec<_> = self
            .entities
            .iter()
            .enumerate()
            .filter(|(_, e)| matches!(e, blazyr_core::Entity::Command(_)))
            .collect();

        temp.sort_by_key(|(_, e)| match e {
            blazyr_core::Entity::Application(app) => app.frequency(),
            blazyr_core::Entity::Command(plug) => plug.frequency(),
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
    let result = FuzzyFinder::search(&search, obj.entities.as_ref());
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
