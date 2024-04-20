import 'package:flutter/material.dart';
import 'package:spotlight/plugin_ui_service.dart';
import 'package:spotlight/service.dart';
import 'package:spotlight/theme.dart';
import 'package:watch_it/watch_it.dart';

import 'rust_helper.dart';

class EntityItem extends StatefulWidget {
  final String name;
  final String description;
  final int index;
  final String type;
  final bool selected;
  final Widget? image;
  final String? searchString;

  const EntityItem({
    super.key,
    required this.index,
    required this.name,
    required this.description,
    required this.type,
    required this.selected,
    this.image,
    this.searchString,
  });

  @override
  State<EntityItem> createState() => _EntityItemState();
}

class _EntityItemState extends State<EntityItem> {
  @override
  Widget build(BuildContext context) {
    final MainScreenService service = di.get();
    final PluginUIService pluginUIService = di.get();

    return ListTile(
      tileColor:
          widget.selected ? CustomTheme.selectionColor : Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      leading: widget.image ?? const Icon(Icons.image_not_supported, size: 20),
      title: Row(children: [
        Text(
          widget.name,
          style: CustomTheme.primaryText,
        ),
        const SizedBox(width: 15),
        Text(
          widget.description,
          style: CustomTheme.secondaryText,
        )
      ]),
      trailing: Text(
        widget.type,
        style: CustomTheme.secondaryText,
      ),
      onTap: () async {
        final result =
            await service.run(widget.index, arg: widget.searchString);
        switch (result) {
          case RunEntityResultUI(:final widget):
            pluginUIService.currentPluginUI = widget;
            pluginUIService.showPluginUI = true;
            break;
          case RunEntityResultText():
          case RunEntityResultNone():
        }
      },
    );
  }
}
