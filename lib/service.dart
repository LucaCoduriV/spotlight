import 'dart:io';

import 'package:flutter/material.dart';

import 'src/rust/api/simple.dart' as rust;

class Service extends ChangeNotifier {
  rust.StateApp? state;
  List<rust.Entity> entities = [];

  int? _index;
  rust.Entity? selected;

  get index => _index;

  Future<void> init() async {
    state = await rust.StateApp.newStateApp();
    await search("");
  }

  void next() {
    if (_index == null) {
      return;
    }
    if ((_index! + 1) >= entities.length) {
      _index = 0;
    } else {
      _index = _index! + 1;
    }
    selected = entities[_index!];
    notifyListeners();
  }

  void previous() {
    if (_index == null) {
      return;
    }
    if ((_index! - 1) < 0) {
      _index = entities.length - 1;
    } else {
      _index = _index! - 1;
    }
    selected = entities[_index!];
    notifyListeners();
  }

  Future<void> select() async {
    if (_index == null) {
      return;
    }
    await execute(entities[_index!].index);
  }

  Future<void> search(String search) async {
    if (state == null) {
      return;
    }
    entities = await rust.search(obj: state!, search: search);
    selected = entities.firstOrNull;
    if (selected != null) {
      _index = 0;
    } else {
      _index = null;
    }
    notifyListeners();
  }

  Future<void> execute(int index) async {
    state?.execute(id: index, onExecuted: () => exit(0));
  }
}
