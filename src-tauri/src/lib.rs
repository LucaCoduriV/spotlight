use gtk::prelude::{ContainerExt, GtkWindowExt, WidgetExt};
use gtk_layer_shell::{KeyboardMode, LayerShell};
use tauri::Manager;

// Learn more about Tauri commands at https://tauri.app/develop/calling-rust/
#[tauri::command]
fn greet(name: &str) -> String {
    format!("Hello, {}! You've been greeted from Rust!", name)
}

#[cfg_attr(mobile, tauri::mobile_entry_point)]
pub fn run() {
    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![greet])
        .setup(|app| {
            let main_window = app.get_webview_window("main").unwrap();
            main_window.hide().unwrap();

            let gtk_window = gtk::ApplicationWindow::new(
                &main_window.gtk_window().unwrap().application().unwrap(),
            );

            // To prevent the window from being black initially.
            gtk_window.set_app_paintable(true);

            let vbox = main_window.default_vbox().unwrap();
            main_window.gtk_window().unwrap().remove(&vbox);
            gtk_window.add(&vbox);

            // Doesn't throw errors.
            gtk_window.init_layer_shell();

            // Just works.
            gtk_window.set_layer(gtk_layer_shell::Layer::Top);
            gtk_window.set_keyboard_mode(KeyboardMode::OnDemand);

            gtk_window.set_width_request(640);
            gtk_window.set_height_request(480);

            gtk_window.show_all();
            Ok(())
        })
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
