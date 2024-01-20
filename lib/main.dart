import 'package:flutter/material.dart';
import 'package:spotlight/src/rust/api/simple.dart';
import 'package:spotlight/src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  final b = await createState();
                  final result = await search(obj: b, search: "fir");
                  for (final e in result) {
                    print(e.name);
                  }
                },
                child: Text("RUST !")),
            const Searchbar(),
            Expanded(
              child: ListView(
                children: [for (int i = 0; i < 10; i++) Entity()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField();
  }
}

class Entity extends StatelessWidget {
  const Entity({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Title"),
      subtitle: Text("Subtitle"),
    );
  }
}
