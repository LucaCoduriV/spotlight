import 'package:flutter/material.dart';
import 'package:spotlight/service.dart';
import 'package:spotlight/src/rust/api/simple.dart';
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
  @override
  void initState() {
    text.addListener(() {
      di.get<Service>().search(text.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final entities = watchPropertyValue((Service s) => s.entities);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Column(
          children: [
            TextField(controller: text),
            Expanded(
              child: ListView(
                children: entities
                    .map((e) => Entity(
                          index: e.index,
                          title: e.name,
                          subtitle: e.description ?? "",
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Entity extends StatelessWidget {
  final String title;
  final String subtitle;
  final int index;
  const Entity(
      {super.key,
      required this.index,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        di.get<Service>().execute(index);
      },
    );
  }
}
