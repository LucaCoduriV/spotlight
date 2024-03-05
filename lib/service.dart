import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'src/rust/api/core.dart' as rust_core;

class Service extends ChangeNotifier {
  rust_core.StateApp? state;
  List<rust_core.Entity> entities = [];
  List<rust_core.Entity> commands = [];
  late Stream<rust_core.DartAction> stream;

  int? _index;
  rust_core.Entity? selected;

  get index => _index;

  Future<void> init() async {
    state = await rust_core.StateApp.newStateApp();
    commands = await state!.getCommands();
    await search("");
    stream = rust_core.setDartActionStream();
    stream.listen((event) {
      if (event == rust_core.DartAction.exit) {
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
    entities = await rust_core.search(obj: state!, search: search);

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
          exit(0);
        });
  }
}
