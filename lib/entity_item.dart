import 'package:flutter/material.dart';
import 'package:spotlight/service.dart';
import 'package:spotlight/theme.dart';
import 'package:watch_it/watch_it.dart';

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
      onTap: () {
        service.execute(index);
      },
    );
  }
}
