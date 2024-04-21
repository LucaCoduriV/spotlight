import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:spotlight/plugin_ui_service.dart';
import 'package:spotlight/service.dart';
import 'package:spotlight/widgets/list.dart';
import 'package:watch_it/watch_it.dart';

import 'main.dart';
import 'plugin_screen.dart';
import 'rust_helper.dart';
import 'shortcuts.dart';
import 'src/rust/api/core.dart' as rust_core;
import 'widgets/bottom_bar.dart';
import 'widgets/search_bar.dart';
import 'widgets/window_frame.dart';

class MainScreen extends StatefulWidget with WatchItStatefulWidgetMixin {
  const MainScreen({
    super.key,
    required this.scrollController,
  });

  final ItemScrollController scrollController;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainScreenService service = di.get();
  final PluginUIService pluginUIService = di.get();
  final text = TextEditingController();

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
    super.dispose();
  }

  Widget? getImage(rust_core.Image? image) {
    final icon = switch (image) {
      null => null,
      rust_core.Image_Data(:final field0) =>
        Image.memory(field0, height: 20, width: 20),
      rust_core.Image_Path(:final field0) => switch (field0.endsWith(".svg")) {
          true => SizedBox(
              width: 20,
              height: 20,
              child: ScalableImageWidget(
                  si: ScalableImage.fromSvgString(_readFileString(field0))),
            ),
          false => Image.file(File(field0), height: 20, width: 20),
        },
    };
    return icon;
  }

  String _readFileString(String filePath) {
    Uri myUri = Uri.parse(filePath);
    File file = File.fromUri(myUri);
    String bytes = file.readAsStringSync();
    return bytes;
  }

  @override
  Widget build(BuildContext context) {
    final entities = watchPropertyValue((MainScreenService s) => s.entities);
    final commands = watchPropertyValue((MainScreenService s) => s.commands);
    final selectedIndex =
        watchPropertyValue((MainScreenService s) => s.selectedEntityIndex);

    return Actions(
      actions: <Type, Action<Intent>>{
        SelectEntryIntent: SelectEntryAction(arg: text.text, ctx: context),
      },
      child: BWindowFrame(
        size: windowSize,
        bottomBar: const BBottomBar(),
        topBar: BSearchBar(textController: text),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (entities.isNotEmpty) const BHeader(text: "Result"),
            if (entities.length + commands.length >= 0)
              Expanded(
                child: BList(
                  itemScrollController: widget.scrollController,
                  itemCount: entities.length +
                      commands.length +
                      (commands.isEmpty ? 0 : 1),
                  itemBuilder: (ctx, index) {
                    if (index < entities.length) {
                      final e = entities[index];
                      return buildListItem(e, index, selectedIndex);
                    } else if (index == entities.length &&
                        commands.isNotEmpty) {
                      return const BHeader(text: "Use with...");
                    }

                    final e = commands[index - entities.length - 1];
                    return buildListItem(e, index - 1, selectedIndex);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  BListItem buildListItem(rust_core.Entity e, int index, selectedIndex) {
    return BListItem(
      image: getImage(e.icon),
      selected: index == selectedIndex,
      index: e.index,
      name: e.name,
      description: e.description ?? "",
      type: e.type,
      searchString: text.text,
      onClick: () async {
        final result = await service.run(e.index);
        switch (result) {
          case RunEntityResultUI(:final widget):
            if (context.mounted && widget != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => PluginScreen(child: widget),
                  fullscreenDialog: true,
                ),
              );
            }
            break;
          case RunEntityResultText():
          case RunEntityResultNone():
        }
      },
    );
  }
}
