import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:spotlight/service.dart';
import 'package:spotlight/theme.dart';
import 'package:watch_it/watch_it.dart';

import 'entity_item.dart';
import 'shortcuts.dart';
import 'src/rust/api/core.dart' as rust_core;

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
  final Service service = di.get();
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
    final entities = watchPropertyValue((Service s) => s.entities);
    final commands = watchPropertyValue((Service s) => s.commands);
    final selectedIndex = watchPropertyValue((Service s) => s.index);
    return Actions(
      actions: <Type, Action<Intent>>{
        SelectEntryIntent: SelectEntryAction(arg: text.text),
      },
      child: Card(
        margin: const EdgeInsets.all(1),
        surfaceTintColor: null,
        color: CustomTheme.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 0.2, color: CustomTheme.textColor),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25.0,
                horizontal: 20,
              ),
              child: TextField(
                textInputAction: TextInputAction.none,
                autofocus: true,
                controller: text,
                showCursor: false,
                style: CustomTheme.primaryText.copyWith(fontSize: 18),
                decoration: InputDecoration.collapsed(
                  hintStyle: CustomTheme.hintText,
                  hintText: 'Search for apps and commands...',
                ),
              ),
            ),
            Divider(thickness: 0.1, color: CustomTheme.textColor),
            if (entities.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Results", style: CustomTheme.headerText),
                  ],
                ),
              ),
            if (entities.length + commands.length >= 0)
              Expanded(
                child: ScrollablePositionedList.builder(
                  itemScrollController: widget.scrollController,
                  itemCount: entities.length +
                      commands.length +
                      (commands.isEmpty ? 0 : 1),
                  itemBuilder: (ctx, index) {
                    if (index < entities.length) {
                      final e = entities[index];
                      return EntityItem(
                        image: getImage(e.icon),
                        selected: index == selectedIndex,
                        index: e.index,
                        name: e.name,
                        description: e.description ?? "",
                        type: e.type,
                        searchString: text.text,
                      );
                    } else if (index == entities.length &&
                        commands.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Use with...", style: CustomTheme.headerText),
                          ],
                        ),
                      );
                    }

                    final e = commands[index - entities.length - 1];
                    return EntityItem(
                      image: getImage(e.icon),
                      selected: index - 1 == selectedIndex,
                      index: e.index,
                      name: e.name,
                      description: e.description ?? "",
                      type: e.type,
                      searchString: text.text,
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
