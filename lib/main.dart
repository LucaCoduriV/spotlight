import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:spotlight/plugin_ui_service.dart';
import 'package:spotlight/service.dart';
import 'package:spotlight/src/rust/frb_generated.dart';
import 'package:spotlight/widgets/bottom_bar.dart';
import 'package:spotlight/widgets/search_bar.dart';
import 'package:watch_it/watch_it.dart';
import 'package:window_manager/window_manager.dart';

import 'shortcuts.dart';
import 'src/rust/api/core.dart' as rust_core;
import 'widgets/window_frame.dart';
import 'window_event_listener.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  const windowSize = Size(750, 550);

  WindowOptions windowOptions = const WindowOptions(
    size: windowSize,
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: true,
    titleBarStyle: TitleBarStyle.hidden,
    maximumSize: windowSize,
    minimumSize: windowSize,
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
  di.registerSingleton<PluginUIService>(PluginUIService());

  runApp(const MyApp(
    windowSize: windowSize,
  ));

  await rust_core.onExit();
}

class MyApp extends StatefulWidget with WatchItStatefulWidgetMixin {
  final Size windowSize;
  const MyApp({super.key, required this.windowSize});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final text = TextEditingController();
  final Service service = di.get();
  final ItemScrollController scrollController = ItemScrollController();
  final windowEventListener = WindowEventListener();
  final TextEditingController textEditingController = TextEditingController();

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
            child: BWindowFrame(
              size: widget.windowSize,
              bottomBar: const BBottomBar(),
              topBar: BSearchBar(textController: textEditingController),
              child: const Column(
                children: [
                  Text("coucou"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget rComponentToFlutterWidget(
    rust_core.BlazyrComponent component, int index, Service service) {
  callback(rust_core.BlazyrComponent component) =>
      rComponentToFlutterWidget(component, index, service);
  return switch (component) {
    rust_core.BlazyrComponent_Column(:final children) => Column(
        children: [for (final child in children!) callback(child)],
      ),
    rust_core.BlazyrComponent_Row(:final children!) => Row(
        children: [for (final child in children) callback(child)],
      ),
    rust_core.BlazyrComponent_Container(:final child) => Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.all(2.0),
        color: Colors.red,
        child: child != null ? callback(child) : null,
      ),
    rust_core.BlazyrComponent_Clickable(:final child, :final onClick) =>
      GestureDetector(
        onTap: () {
          if (onClick != null) {
            service.clickableComponent(index, onClick);
          }
        },
        child: child != null ? callback(child) : null,
      ),
  };
}
