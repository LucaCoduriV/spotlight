import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../theme.dart';

class BList extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext ctx, int index) itemBuilder;
  final ItemScrollController? itemScrollController;

  const BList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.itemScrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemScrollController: itemScrollController,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}

class BListItem extends StatelessWidget {
  final String name;
  final String description;
  final int index;
  final String type;
  final bool selected;
  final Widget? image;
  final String? searchString;
  final void Function()? onClick;

  const BListItem({
    super.key,
    required this.index,
    required this.name,
    required this.description,
    required this.type,
    required this.selected,
    this.image,
    this.searchString,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: selected ? CustomTheme.selectionColor : Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      leading: image ?? const Icon(Icons.image_not_supported, size: 20),
      title: Row(children: [
        Text(
          name,
          style: CustomTheme.primaryText,
        ),
        const SizedBox(width: 15),
        Text(
          description,
          style: CustomTheme.secondaryText,
        )
      ]),
      trailing: Text(
        type,
        style: CustomTheme.secondaryText,
      ),
      onTap: onClick,
    );
  }
}

class BHeader extends StatelessWidget {
  final String text;
  const BHeader({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text, style: CustomTheme.headerText),
        ],
      ),
    );
  }
}
