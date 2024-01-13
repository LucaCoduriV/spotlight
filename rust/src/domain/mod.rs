use std::fs;

use anyhow::Result;
use freedesktop_desktop_entry::{default_paths, DesktopEntry};
use fuzzy_matcher::{skim::SkimMatcherV2, FuzzyMatcher};

trait Application {
    fn name(&self) -> &str;
    fn exec(&self) -> Result<()>;
}

#[derive(Debug)]
struct LinuxApplication {
    name: String,
    exec: String,
    icon: Option<String>,
    keywords: Option<String>,
}

impl LinuxApplication {
    fn from_desktop_entry(entry: &DesktopEntry<'_>) -> Option<Self> {
        let name = entry.name(None)?.to_string();
        let exec = entry.exec()?.to_string();
        let icon = entry.icon().map(|i| i.to_string());
        let keywords = entry.keywords().map(|s| s.to_string());

        Some(Self {
            name,
            exec,
            icon,
            keywords,
        })
    }

    fn get_applications() -> Vec<Self> {
        let mut result = Vec::new();
        for path in default_paths() {
            if let Ok(files) = fs::read_dir(&path) {
                for file in files {
                    let path_file = file.unwrap().path();

                    if let Ok(bytes) = fs::read_to_string(&path_file) {
                        let entry = DesktopEntry::decode(&path, &bytes).unwrap();
                        let app = LinuxApplication::from_desktop_entry(&entry);
                        if let Some(app) = app {
                            result.push(app);
                        }
                    }
                }
            }
        }
        result
    }
}

impl Application for LinuxApplication {
    fn name(&self) -> &str {
        &self.name
    }

    fn exec(&self) -> Result<()> {
        todo!()
    }
}

enum Entity {
    // TODO better not use box for perf
    App(Box<dyn Application>),
    Clipboard,
    Link,
}

struct FuzzyFinder {
    entities: Vec<Entity>,
}

impl FuzzyFinder {
    pub fn search(&self, search: &str) -> Vec<(i64, &Entity)> {
        let matcher = SkimMatcherV2::default();

        let mut result: Vec<(i64, &Entity)> = Vec::new();
        for (index, entity) in self.entities.iter().enumerate() {
            let score = match entity {
                Entity::App(app) => matcher.fuzzy_match(app.name(), search),
                Entity::Clipboard => None,
                Entity::Link => None,
            };
            if let Some(score) = score {
                let pos = result
                    .binary_search_by(|(curr_score, _)| score.cmp(curr_score))
                    .unwrap_or_else(|e| e);
                result.insert(pos, (score, &self.entities[index]))
            }
        }
        result
    }
}

#[cfg(test)]
mod test {
    use super::{Entity, FuzzyFinder, LinuxApplication};

    #[test]
    fn get_applications() {
        let apps = LinuxApplication::get_applications();
        println!("{:?}", apps.len());
    }

    #[test]
    fn search_app() {
        let apps = LinuxApplication::get_applications();
        let entities: Vec<_> = apps
            .into_iter()
            .map(|app| Entity::App(Box::new(app)))
            .collect();

        let fuzzy_finder = FuzzyFinder { entities };
        let results = fuzzy_finder.search("fir");
        println!("{:?}", results.len());
        for result in results {
            match result.1 {
                Entity::App(app) => println!("Score: {}, Entity: {}", result.0, app.name()),
                Entity::Clipboard => todo!(),
                Entity::Link => todo!(),
            }
        }
    }
}
