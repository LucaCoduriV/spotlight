#![allow(dead_code)]

#[cfg(target_os = "linux")]
use crate::linux::LinuxApplication;
#[cfg(target_os = "linux")]
mod linux;

mod mock;

use anyhow::Result;
use fuzzy_matcher::{skim::SkimMatcherV2, FuzzyMatcher};
use std::{borrow::Borrow, rc::Rc};

use self::mock::FakeApplication;

pub trait Application {
    fn name(&self) -> &str;
    fn exec(&self) -> Result<()>;
}

#[derive(Clone)]
pub enum EntityType {
    App,
    Command,
}

#[derive(Clone)]
pub struct Entity {
    pub name: String,
    pub description: Option<String>,
    pub alias: Option<String>,
    pub command: Rc<Box<dyn Fn() -> Result<()>>>,
    pub r#type: EntityType,
}

pub struct AppState {
    pub fuzzy_finder: FuzzyFinder,
}

impl AppState {
    pub fn new() -> Self {
        #[cfg(target_os = "linux")]
        let apps = LinuxApplication::get_applications();
        #[cfg(not(target_os = "linux"))]
        let apps: Vec<FakeApplication> = vec![
            FakeApplication("Firefox".to_string()),
            FakeApplication("Google Chrome".to_string()),
            FakeApplication("Steam".to_string()),
        ];

        let mut entities: Vec<_> = Vec::new();
        for app in apps.into_iter() {
            let entity = Entity {
                name: app.name().to_owned(),
                description: None,
                alias: None,
                command: Rc::new(Box::new(move || app.exec())),
                r#type: EntityType::App,
            };
            entities.push(entity);
        }

        AppState {
            fuzzy_finder: FuzzyFinder::new(entities),
        }
    }

    pub fn search(&self, search: String) -> Vec<Entity> {
        self.fuzzy_finder
            .search(&search)
            .into_iter()
            .map(|(_, e)| e.clone())
            .collect()
    }
}

impl Default for AppState {
    fn default() -> Self {
        Self::new()
    }
}

pub struct FuzzyFinder {
    entities: Vec<Entity>,
}

impl FuzzyFinder {
    pub fn new(entities: Vec<Entity>) -> Self {
        Self { entities }
    }

    pub fn search(&self, search: &str) -> Vec<(i64, &Entity)> {
        let matcher = SkimMatcherV2::default();

        let mut result: Vec<(i64, &Entity)> = Vec::new();
        for entity in self.entities.iter() {
            let score = matcher.fuzzy_match(entity.name.borrow(), search);

            if let Some(score) = score {
                let pos = result
                    .binary_search_by(|(curr_score, _)| score.cmp(curr_score))
                    .unwrap_or_else(|e| e);
                result.insert(pos, (score, entity))
            }
        }
        result
    }
}

#[cfg(test)]
mod test {

    use std::rc::Rc;

    use crate::domain::EntityType;

    use super::{mock::FakeApplication, Application, Entity, FuzzyFinder};

    #[test]
    fn run_app() {
        let apps = FakeApplication::get_apps();
        let mut entities: Vec<_> = Vec::new();
        for app in apps.into_iter() {
            let entity = Entity {
                name: app.name().to_owned(),
                description: None,
                alias: None,
                command: Rc::new(Box::new(move || app.exec())),
                r#type: EntityType::App,
            };
            entities.push(entity);
        }

        let fuzzy_finder = FuzzyFinder { entities };
        let results = fuzzy_finder.search("firefox");
        let (_score, entity) = results[0];
        (*entity.command)().expect("Couldn't run the program succesfully");
    }

    #[test]
    fn search_app() {
        let apps = FakeApplication::get_apps();
        let mut entities: Vec<_> = Vec::new();
        for app in apps.into_iter() {
            let entity = Entity {
                name: app.name().to_owned(),
                description: None,
                alias: None,
                command: Rc::new(Box::new(move || app.exec())),
                r#type: EntityType::App,
            };
            entities.push(entity);
        }

        let fuzzy_finder = FuzzyFinder { entities };
        let results = fuzzy_finder.search("fir");
        println!("{:?}", results.len());
        for (score, entity) in results {
            println!("Score: {}, Entity: {}", score, entity.name);
        }
    }
}
