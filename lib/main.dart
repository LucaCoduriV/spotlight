import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotlight/service.dart';
import 'package:spotlight/src/rust/frb_generated.dart';
import 'package:watch_it/watch_it.dart';

Future<void> main() async {
  await RustLib.init();
  final service = di.registerSingleton<Service>(Service());
  service.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget with WatchItStatefulWidgetMixin {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final text = TextEditingController();
  final listFocusNode = FocusNode();
  int resultSelectedIndex = 0;

  @override
  void initState() {
    text.addListener(() async {
      await di.get<Service>().search(text.text);
      resultSelectedIndex = 0;
    });
    super.initState();
  }

  @override
  void dispose() {
    text.dispose();
    listFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final entities = watchPropertyValue((Service s) => s.entities);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Focus(
          onKeyEvent: (node, keyEvent) {
            if (keyEvent is KeyUpEvent) {
              return KeyEventResult.ignored;
            }

            if (keyEvent.logicalKey == LogicalKeyboardKey.arrowLeft ||
                keyEvent.logicalKey == LogicalKeyboardKey.arrowRight) {
              return KeyEventResult.skipRemainingHandlers;
            }

            if (keyEvent.logicalKey == LogicalKeyboardKey.enter) {
              final service = di.get<Service>();
              final entity = service.entities[resultSelectedIndex];
              service.execute(entity.index);
              return KeyEventResult.handled;
            }
            if (keyEvent.logicalKey == LogicalKeyboardKey.arrowUp) {
              setState(() {
                resultSelectedIndex--;
              });
              return KeyEventResult.handled;
            }
            if (keyEvent.logicalKey == LogicalKeyboardKey.arrowDown) {
              setState(() {
                resultSelectedIndex++;
              });
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    autofocus: true,
                    controller: text,
                    showCursor: false,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Results"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TextFieldTapRegion(
                      child: ListView(
                        children: entities.mapIndexed((index, e) {
                          return EntityItem(
                            selected: index == resultSelectedIndex,
                            index: e.index,
                            name: e.name,
                            description: e.description ?? "description",
                            type: "Application",
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EntityItem extends StatelessWidget {
  final String name;
  final String description;
  final int index;
  final String type;
  final bool selected;
  const EntityItem({
    super.key,
    required this.index,
    required this.name,
    required this.description,
    required this.type,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
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
      leading: const Icon(Icons.info),
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
        di.get<Service>().execute(index);
      },
    );
  }
}
