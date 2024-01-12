use std::fs;

use anyhow::Result;
use freedesktop_desktop_entry::{default_paths, DesktopEntry};

trait Application: Sized {
    fn name(&self) -> &str;
    fn exec(&self) -> Result<()>;
    fn get_applications() -> Vec<Self>;
}

#[derive(Debug)]
struct LinuxApplication {
    name: String,
}

impl Application for LinuxApplication {
    fn name(&self) -> &str {
        &self.name
    }

    fn exec(&self) -> Result<()> {
        todo!()
    }

    fn get_applications() -> Vec<Self> {
        let mut result = Vec::new();
        for path in default_paths() {
            if let Ok(files) = fs::read_dir(&path) {
                for file in files {
                    let path_file = file.unwrap().path();

                    if let Ok(bytes) = fs::read_to_string(&path_file) {
                        let entry = DesktopEntry::decode(&path, &bytes).unwrap();
                        let name = entry
                            .name(None)
                            .unwrap_or(std::borrow::Cow::Borrowed(""))
                            .into_owned();

                        let name = entry.id().to_string();

                        let app = LinuxApplication { name };
                        result.push(app);
                    }
                }
            }
        }
        result
    }
}
