import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:spotlight/service.dart';
import 'package:spotlight/src/rust/api/simple.dart';
import 'package:spotlight/theme.dart';
import 'package:watch_it/watch_it.dart';

import 'entity_item.dart';

class MainScreen extends StatefulWidget with WatchItStatefulWidgetMixin {
  const MainScreen({
    super.key,
    required this.scrollController,
  });

  final AutoScrollController scrollController;

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

  @override
  Widget build(BuildContext context) {
    final entities = watchPropertyValue((Service s) => s.entities);
    final selected = watchPropertyValue((Service s) => s.selected);
    return Card(
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
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Results", style: CustomTheme.headerText),
              ],
            ),
          ),
          Expanded(
            child: TextFieldTapRegion(
              child: EntityItemList(
                widget: widget,
                entities: entities,
                selected: selected,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EntityItemList extends StatelessWidget {
  const EntityItemList({
    super.key,
    required this.widget,
    required this.entities,
    required this.selected,
  });

  final MainScreen widget;
  final List<Entity> entities;
  final Entity? selected;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      controller: widget.scrollController,
      children: entities.mapIndexed((index, e) {
        final svg = switch (e.iconPath?.endsWith(".svg")) {
          true => SvgPicture.file(File(e.iconPath!), height: 20),
          _ => null,
        };

        final image = e.iconPath != null && svg == null
            ? Image.file(File(e.iconPath!), height: 20)
            : null;

        return AutoScrollTag(
          key: ValueKey(index),
          index: index,
          controller: widget.scrollController,
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
    );
  }
}
