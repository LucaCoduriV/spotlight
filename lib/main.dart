import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:spotlight/service.dart';
import 'package:spotlight/src/rust/frb_generated.dart';
import 'package:watch_it/watch_it.dart';
import 'package:window_manager/window_manager.dart';

import 'main_screen.dart';
import 'shortcuts.dart';
import 'src/rust/api/core.dart' as rust_core;
import 'window_event_listener.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(750, 550),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: true,
    titleBarStyle: TitleBarStyle.hidden,
    maximumSize: Size(750, 550),
    minimumSize: Size(750, 550),
    fullScreen: false,
    alwaysOnTop: true,
    windowButtonVisibility: false,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setResizable(false);
  });

  await RustLib.init();
  final service = di.registerSingleton<Service>(Service());
  service.init();

  runApp(const MyApp());
  await rust_core.onExit();
}

class MyApp extends StatefulWidget with WatchItStatefulWidgetMixin {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final text = TextEditingController();
  final Service service = di.get();
  final ItemScrollController scrollController = ItemScrollController();
  final windowEventListener = WindowEventListener();

  @override
  void initState() {
    super.initState();
    windowManager.addListener(windowEventListener);
  }

  @override
  void dispose() {
    windowManager.removeListener(windowEventListener);
    super.dispose();
  }

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
            LogicalKeySet(
              LogicalKeyboardKey.control,
              LogicalKeyboardKey.keyP,
            ): const PreviousIntent(),
            LogicalKeySet(
              LogicalKeyboardKey.control,
              LogicalKeyboardKey.keyN,
            ): const NextIntent(),
            LogicalKeySet(LogicalKeyboardKey.enter): const SelectEntryIntent(),
            LogicalKeySet(LogicalKeyboardKey.escape): const CloseIntent(),
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              PreviousIntent: PreviousAction(scrollController),
              NextIntent: NextAction(scrollController),
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

Widget rComponentToFlutterWidget(rust_core.BlazyrComponent component) {
  return switch (component) {
    rust_core.BlazyrComponent_Column(:final children) => Column(
        children: [
          for (final child in children!) rComponentToFlutterWidget(child)
        ],
      ),
    rust_core.BlazyrComponent_Row(:final children!) => Row(
        children: [
          for (final child in children) rComponentToFlutterWidget(child)
        ],
      ),
    rust_core.BlazyrComponent_Container(:final child, :final onClick) =>
      Container(
        child: child != null ? rComponentToFlutterWidget(child) : null,
      ),
  };
}
