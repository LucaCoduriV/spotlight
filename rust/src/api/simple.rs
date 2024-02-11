use std::fs;

use directories::ProjectDirs;
use flutter_rust_bridge::DartFnFuture;
use spotlight_core::{get_entities, FuzzyFinder, TEntity};
use thiserror::Error;

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

#[flutter_rust_bridge::frb(opaque)]
pub struct StateApp {
    pub entities: Vec<Box<dyn TEntity + Send + Sync>>,
}

impl StateApp {
    #[allow(clippy::new_without_default)]
    pub fn new() -> StateApp {
        if let Some(proj_dirs) = ProjectDirs::from("com", "blazyr", "Blazyr") {
            let config_folder = proj_dirs.config_local_dir();
            fs::create_dir_all(config_folder).unwrap();

            let config_folder = config_folder.to_string_lossy();
            StateApp {
                entities: get_entities(Some(&config_folder)),
            }
        } else {
            StateApp {
                entities: get_entities(Some(".")),
            }
        }
    }

    pub async fn execute(
        &mut self,
        id: usize,
        arg: Option<String>,
        on_executed: impl Fn() -> DartFnFuture<()>,
    ) -> Result<(), EntityError> {
        let result = self.entities[id]
            .execute(arg.as_deref())
            .map_err(|e| EntityError::Unknown(e.to_string()));
        on_executed().await;
        result
    }

    pub fn get_commands(&self) -> Vec<Entity> {
        let mut temp: Vec<_> = self
            .entities
            .iter()
            .enumerate()
            .filter(|(_, e)| matches!(e.etype(), spotlight_core::EType::Command))
            .collect();

        temp.sort_by_key(|(_, e)| e.frequency());

        temp.iter()
            .map(|(i, e)| Entity {
                index: *i,
                name: e.name().to_string(),
                alias: e.alias().map(|v| v.to_string()),
                description: e.description().map(|v| v.to_string()),
                icon_path: e.icon_path().map(|v| v.to_string()),
                etype: match e.etype() {
                    spotlight_core::EType::Application => "Application".to_owned(),
                    spotlight_core::EType::Command => "Command".to_owned(),
                },
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
    pub icon_path: Option<String>,
    pub etype: String,
}

pub fn search(obj: &StateApp, search: String) -> Vec<Entity> {
    let result = FuzzyFinder::search(&search, obj.entities.as_ref());
    result
        .into_iter()
        .map(|(index, _score, ent)| Entity {
            index,
            name: ent.name().to_string(),
            alias: ent.alias().map(|v| v.to_string()),
            description: ent.description().map(|v| v.to_string()),
            icon_path: ent.icon_path().map(|v| v.to_string()),
            etype: match ent.etype() {
                spotlight_core::EType::Application => "Application".to_owned(),
                spotlight_core::EType::Command => "Command".to_owned(),
            },
        })
        .collect()
}
