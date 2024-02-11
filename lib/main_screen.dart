import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:spotlight/entity_item_list.dart';
import 'package:spotlight/service.dart';
import 'package:spotlight/theme.dart';
import 'package:watch_it/watch_it.dart';

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
    final entities = watchPropertyValue((Service s) => s.searchResult);
    final commands = watchPropertyValue((Service s) => s.entitiesCommands);
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
            child: EntityItemList(
              widget: widget,
              entities: entities
                  .getRange(0, entities.length >= 3 ? 3 : entities.length)
                  .toList(),
              selected: selected,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Commands", style: CustomTheme.headerText),
              ],
            ),
          ),
          Expanded(
            child: EntityItemList(
              searchString: text.text,
              widget: widget,
              entities: commands,
              selected: commands.firstOrNull,
            ),
          ),
        ],
      ),
    );
  }
}
