import 'dart:io';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:spotlight/entity_item.dart';
import 'package:spotlight/main_screen.dart';
import 'package:spotlight/src/rust/api/simple.dart';

class EntityItemList extends StatelessWidget {
  const EntityItemList({
    super.key,
    required this.widget,
    required this.entities,
    this.selected,
    this.searchString,
  });

  final MainScreen widget;
  final List<Entity> entities;
  final Entity? selected;
  final String? searchString;

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
    return ListView(
      padding: const EdgeInsets.all(8.0),
      controller: widget.scrollController,
      children: entities.mapIndexed((index, e) {
        return AutoScrollTag(
          key: ValueKey(index),
          index: index,
          controller: widget.scrollController,
          child: EntityItem(
            image: getImage(e.iconPath),
            selected: e.index == selected!.index,
            index: e.index,
            name: e.name,
            description: e.description ?? "",
            type: e.etype,
            searchString: searchString,
          ),
        );
      }).toList(),
    );
  }
}
