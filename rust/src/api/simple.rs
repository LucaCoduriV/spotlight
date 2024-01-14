use crate::domain::{linux::LinuxApplication, AppStateLinux, Entity};

#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

pub fn search(search: String) {
    let state = AppStateLinux::new();
    state.search(&search);
}
