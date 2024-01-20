use spotlight_core::{get_entities, FuzzyFinder, TEntity};

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
pub struct State {
    pub entities: Vec<Box<dyn TEntity + Send + Sync>>,
}

pub struct Entity {
    pub name: String,
}

pub fn create_state() -> State {
    State {
        entities: get_entities(None),
    }
}

pub fn search(obj: &State, search: String) -> Vec<Entity> {
    let result = FuzzyFinder::search(&search, obj.entities.as_ref());
    result
        .into_iter()
        .map(|(_score, ent)| Entity {
            name: ent.name().to_string(),
        })
        .collect()
}
