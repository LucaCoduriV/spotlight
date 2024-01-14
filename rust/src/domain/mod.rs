#![allow(dead_code)]

mod linux;

use std::borrow::{Borrow, Cow};

use anyhow::Result;
use fuzzy_matcher::{skim::SkimMatcherV2, FuzzyMatcher};

pub trait Application {
    fn name(&self) -> &str;
    fn exec(&self) -> Result<()>;
}

pub enum EntityType {
    App,
    Command,
}

pub struct Entity<'a> {
    name: Cow<'a, str>,
    description: Cow<'a, str>,
    alias: Cow<'a, str>,
    command: Box<dyn Fn() -> Result<()> + 'a>,
    r#type: EntityType,
}

pub struct FuzzyFinder<'a> {
    entities: Vec<Entity<'a>>,
}

impl<'a> FuzzyFinder<'a> {
    pub fn search(&self, search: &str) -> Vec<(i64, &Entity<'a>)> {
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

    use crate::domain::{linux::LinuxApplication, Application, EntityType};

    use super::{Entity, FuzzyFinder};

    #[test]
    fn run_app() {
        let apps = LinuxApplication::get_applications();
        let mut entities: Vec<_> = Vec::new();
        for app in apps.iter() {
            let entity = Entity {
                name: app.name().into(),
                description: "test".into(),
                alias: "alias".into(),
                command: Box::new(move || app.exec()),
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
        let apps = LinuxApplication::get_applications();
        let mut entities: Vec<_> = Vec::new();
        for app in apps.iter() {
            let entity = Entity {
                name: app.name().into(),
                description: "test".into(),
                alias: "alias".into(),
                command: Box::new(move || app.exec()),
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
