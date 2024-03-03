import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'src/rust/api/simple.dart' as rust;

class Service extends ChangeNotifier {
  rust.StateApp? state;
  List<rust.Entity> entities = [];
  List<rust.Entity> commands = [];
  late Stream<rust.DartAction> stream;

  int? _index;
  rust.Entity? selected;

  get index => _index;

  Future<void> init() async {
    state = await rust.StateApp.newStateApp();
    commands = await state!.getCommands();
    await search("");
    stream = rust.setDartActionStream();
    stream.listen((event) {
      if (event == rust.DartAction.exit) {
        print("ASKED TO EXIT");
        exit(0);
      }
    });
  }

  /// Select the next item in searchResult or in entitiesCommands
  void next() {
    if (_index == null) {
      return;
    }
    if ((_index! + 1) >= entities.length + commands.length) {
      _index = 0;
    } else {
      _index = _index! + 1;
    }
    if (_index! >= entities.length) {
      selected = commands[_index! - entities.length];
    } else {
      selected = entities[_index!];
    }
    notifyListeners();
  }

  /// Select the previous item in searchResult or in entitiesCommands
  void previous() {
    if (_index == null) {
      return;
    }
    if ((_index! - 1) < 0) {
      _index = entities.length + commands.length - 1;
    } else {
      _index = _index! - 1;
    }
    if (_index! < entities.length) {
      selected = entities[_index!];
    } else {
      selected = commands[_index! - entities.length];
    }
    notifyListeners();
  }

  Future<void> select({String? arg}) async {
    if (selected == null) {
      return;
    }
    await execute(selected!.index, arg: arg);
  }

  Future<void> search(String search) async {
    if (state == null) {
      return;
    }
    entities = await rust.search(obj: state!, search: search);

    // After each search select the first entity available
    selected = entities.firstOrNull;
    _index = 0;
    if (entities.isEmpty) {
      selected = commands.firstOrNull;
      if (commands.isEmpty) {
        _index = null;
      }
    }
    notifyListeners();
  }

  Future<void> execute(int index, {String? arg}) async {
    windowManager.hide();
    state?.execute(
        id: index,
        arg: arg,
        onExecuted: () async {
          await rust.onExit();
          exit(0);
        });
  }
}
