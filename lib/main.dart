import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:spotlight/service.dart';
import 'package:spotlight/src/rust/frb_generated.dart';
import 'package:watch_it/watch_it.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(600, 250),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: true,
    titleBarStyle: TitleBarStyle.hidden,
    maximumSize: Size(800, 600),
    minimumSize: Size(800, 600),
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
  runApp(const MyApp());
}

class MyApp extends StatefulWidget with WatchItStatefulWidgetMixin {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final text = TextEditingController();
  final listFocusNode = FocusNode();
  final Service service = di.get();
  final AutoScrollController scrollController = AutoScrollController();

  @override
  void initState() {
    text.addListener(() async {
      await service.search(text.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    text.dispose();
    listFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final entities = watchPropertyValue((Service s) => s.entities);
    final selected = watchPropertyValue((Service s) => s.selected);
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
            LogicalKeySet(LogicalKeyboardKey.enter): const SelectIntent(),
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              PreviousIntent: PreviousAction(scrollController),
              NextIntent: NextAction(scrollController),
              SelectIntent: SelectAction(),
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      autofocus: true,
                      controller: text,
                      showCursor: false,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Results"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TextFieldTapRegion(
                        child: ListView(
                          controller: scrollController,
                          children: entities.mapIndexed((index, e) {
                            final svg = switch (e.iconPath?.endsWith(".svg")) {
                              true =>
                                SvgPicture.file(File(e.iconPath!), height: 20),
                              _ => null,
                            };

                            final image = e.iconPath != null && svg == null
                                ? Image.file(File(e.iconPath!), height: 20)
                                : null;

                            return AutoScrollTag(
                              key: ValueKey(index),
                              index: index,
                              controller: scrollController,
                              child: EntityItem(
                                image: svg ?? image,
                                selected: e.index == selected!.index,
                                index: e.index,
                                name: e.name,
                                description: e.description ?? "description",
                                type: "Application",
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EntityItem extends StatelessWidget {
  final String name;
  final String description;
  final int index;
  final String type;
  final bool selected;
  final Widget? image;

  const EntityItem({
    super.key,
    required this.index,
    required this.name,
    required this.description,
    required this.type,
    required this.selected,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final Service service = di.get();
    const TextStyle textStyleTitle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
    );

    const TextStyle textStyleTrailing = TextStyle(
      fontSize: 15,
    );

    return ListTile(
      tileColor: selected ? Colors.black.withAlpha(25) : Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      leading: image ?? const Icon(Icons.image_not_supported),
      title: Row(children: [
        Text(
          name,
          style: textStyleTitle,
        ),
        const SizedBox(width: 15),
        Text(description)
      ]),
      trailing: Text(
        type,
        style: textStyleTrailing,
      ),
      onTap: () {
        service.execute(index);
      },
    );
  }
}

class PreviousIntent extends Intent {
  const PreviousIntent();
}

class PreviousAction extends Action<PreviousIntent> {
  final Service service = di.get();
  final AutoScrollController controller;
  PreviousAction(this.controller);

  @override
  Object? invoke(covariant PreviousIntent intent) {
    service.previous();
    if (service.index != null) {
      controller.scrollToIndex(service.index!,
          duration: const Duration(milliseconds: 1));
    }
    return null;
  }
}

class NextIntent extends Intent {
  const NextIntent();
}

class NextAction extends Action<NextIntent> {
  final Service service = di.get();
  final AutoScrollController controller;
  NextAction(this.controller);

  @override
  Object? invoke(covariant NextIntent intent) {
    service.next();
    if (service.index != null) {
      controller.scrollToIndex(service.index!,
          duration: const Duration(milliseconds: 1));
    }
    return null;
  }
}

class SelectIntent extends Intent {
  const SelectIntent();
}

class SelectAction extends Action<SelectIntent> {
  final Service service = di.get();
  SelectAction();

  @override
  Object? invoke(covariant SelectIntent intent) {
    service.select();
    return null;
  }
}
