import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:spotlight/service.dart';
import 'package:spotlight/src/rust/frb_generated.dart';
import 'package:watch_it/watch_it.dart';
import 'package:window_manager/window_manager.dart';

import 'main_screen.dart';
import 'shortcuts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(600, 250),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: true,
    titleBarStyle: TitleBarStyle.hidden,
    maximumSize: Size(850, 600),
    minimumSize: Size(850, 600),
    fullScreen: false,
    alwaysOnTop: true,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setResizable(false);
  });

  await RustLib.init();
  final service = di.registerSingleton<Service>(Service());
  service.init();
  runApp(const WindowEventListener());
}

class WindowEventListener extends StatefulWidget {
  const WindowEventListener({super.key});

  @override
  State<WindowEventListener> createState() => WindowEventListenerState();
}

class WindowEventListenerState extends State<WindowEventListener>
    with WindowListener {
  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowBlur() {
    super.onWindowBlur();
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class MyApp extends StatefulWidget with WatchItStatefulWidgetMixin {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final text = TextEditingController();
  final Service service = di.get();
  final AutoScrollController scrollController = AutoScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.arrowUp): const PreviousIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowDown): const NextIntent(),
            LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyP):
                const PreviousIntent(),
            LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyN):
                const NextIntent(),
            LogicalKeySet(LogicalKeyboardKey.enter): const SelectEntryIntent(),
            LogicalKeySet(LogicalKeyboardKey.escape): const CloseIntent(),
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              PreviousIntent: PreviousAction(scrollController),
              NextIntent: NextAction(scrollController),
              SelectIntent: SelectEntryAction(),
              CloseIntent: CloseAction(),
            },
            child: MainScreen(
              scrollController: scrollController,
            ),
          ),
        ),
      ),
    );
  }
}
