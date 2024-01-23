import 'package:flutter/material.dart';
import 'package:spotlight/service.dart';
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
