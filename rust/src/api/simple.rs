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
    pub fn new() -> StateApp {
        StateApp {
            entities: get_entities(None),
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

pub fn search(obj: &mut StateApp, search: String) -> Vec<Entity> {
    let result = FuzzyFinder::search(&search, obj.entities.as_mut());
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
