import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:spotlight/service.dart';
import 'package:spotlight/theme.dart';
import 'package:watch_it/watch_it.dart';

import 'entity_item.dart';
import 'shortcuts.dart';

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

  Widget? getImage(String? path) {
    if (path == null) {
      return null;
    }
    try {
      final svg = switch (path.endsWith(".svg")) {
        true => SvgPicture.file(File(path), height: 20),
        _ => null,
      };

      if (svg != null) {
        return svg;
      }

      return Image.file(File(path), height: 20);
    } catch (e) {
      return null;
    }
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
                  itemCount: entities.length + commands.length + 1,
                  itemBuilder: (ctx, index) {
                    if (index < entities.length) {
                      final e = entities[index];
                      return EntityItem(
                        image: getImage(e.iconPath),
                        selected: index == selectedIndex,
                        index: e.index,
                        name: e.name,
                        description: e.description ?? "",
                        type: e.etype,
                        searchString: text.text,
                      );
                    } else if (index == entities.length) {
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
                      image: getImage(e.iconPath),
                      selected: index - 1 == selectedIndex,
                      index: e.index,
                      name: e.name,
                      description: e.description ?? "",
                      type: e.etype,
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
