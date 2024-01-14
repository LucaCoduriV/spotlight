use anyhow::Result;
use std::{fs, process::Command};
use thiserror::Error;

use freedesktop_desktop_entry::{default_paths, DesktopEntry};

use super::Application;

#[derive(Debug)]
pub struct LinuxApplication {
    name: String,
    exec: Vec<String>,
    icon: Option<String>,
    keywords: Option<String>,
}

impl LinuxApplication {
    fn from_desktop_entry(entry: &DesktopEntry<'_>) -> Option<Self> {
        let name = entry.name(None)?.to_string();
        let exec = entry.exec()?.split(' ').map(|s| s.to_string()).collect();
        let icon = entry.icon().map(|i| i.to_string());
        let keywords = entry.keywords().map(|s| s.to_string());

        Some(Self {
            name,
            exec,
            icon,
            keywords,
        })
    }

    pub fn get_applications() -> Vec<Self> {
        let mut result = Vec::new();
        for path in default_paths() {
            if let Ok(files) = fs::read_dir(&path) {
                for file in files {
                    let path_file = file.unwrap().path();
                    println!("{}", path_file.to_str().unwrap());

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
        Command::new(&self.exec[0]).spawn()?;
        Ok(())
    }
}

pub enum FDEntryExecToken {
    File,
    Files,
    Url,
    Urls,
    // TODO add the remainings
}

#[derive(Error, Debug)]
pub enum ParseError {
    #[error("'{0}' is not a valid token")]
    InvalidToken(String),
}

impl<'a> TryFrom<&'a str> for FDEntryExecToken {
    type Error = ParseError;

    fn try_from(value: &'a str) -> std::prelude::v1::Result<Self, Self::Error> {
        match value {
            "%u" => Ok(FDEntryExecToken::Url),
            "%U" => Ok(FDEntryExecToken::Urls),
            "%f" => Ok(FDEntryExecToken::File),
            "%F" => Ok(FDEntryExecToken::Files),
            t => Err(ParseError::InvalidToken(t.to_string())),
        }
    }
}

pub fn fd_entry_exec_tokenizer(input: &[&str]) -> Vec<FDEntryExecToken> {
    input
        .iter()
        .filter_map(|&t| FDEntryExecToken::try_from(t).ok())
        .collect()
}

#[cfg(test)]
mod test {
    use super::LinuxApplication;

    #[test]
    fn get_applications() {
        let apps = LinuxApplication::get_applications();
        println!("{:?}", apps.len());
    }
}
