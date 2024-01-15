use super::Application;
use anyhow::Result;

pub struct FakeApplication(pub String);

impl FakeApplication {
    pub fn get_apps() -> Vec<FakeApplication> {
        vec![
            FakeApplication("Firefox".to_string()),
            FakeApplication("Google Chrome".to_string()),
            FakeApplication("Steam".to_string()),
            FakeApplication("Calculator".to_string()),
            FakeApplication("Microsoft Teams".to_string()),
            FakeApplication("Vivaldi".to_string()),
            FakeApplication("Xcode".to_string()),
            FakeApplication("Iterm2".to_string()),
        ]
    }
}

impl Application for FakeApplication {
    fn name(&self) -> &str {
        &self.0
    }

    fn exec(&self) -> Result<()> {
        println!("Exec: {}", self.0);
        Ok(())
    }
}
