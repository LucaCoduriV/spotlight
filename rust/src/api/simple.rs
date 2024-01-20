use spotlight_core::{get_entities, FuzzyFinder, TEntity};
use thiserror::Error;

#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

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
    pub fn new() -> StateApp {
        StateApp {
            entities: get_entities(None),
        }
    }
    pub fn execute(&self, id: usize) -> Result<(), EntityError> {
        self.entities[id]
            .execute()
            .map_err(|e| EntityError::Unknown(e.to_string()))
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
        })
        .collect()
}
