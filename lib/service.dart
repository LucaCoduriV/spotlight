import 'dart:io';

import 'package:flutter/material.dart';

import 'src/rust/api/simple.dart' as rust;

class Service extends ChangeNotifier {
  rust.StateApp? state;
  List<rust.Entity> searchResult = [];
  List<rust.Entity> entitiesCommands = [];

  int? _index;
  rust.Entity? selected;

  get index => _index;

  Future<void> init() async {
    state = await rust.StateApp.newStateApp();
    entitiesCommands = await state!.getCommands();
    await search("");
  }

  void next() {
    if (_index == null) {
      return;
    }
    if ((_index! + 1) >= searchResult.length) {
      _index = 0;
    } else {
      _index = _index! + 1;
    }
    selected = searchResult[_index!];
    notifyListeners();
  }

  void previous() {
    if (_index == null) {
      return;
    }
    if ((_index! - 1) < 0) {
      _index = searchResult.length - 1;
    } else {
      _index = _index! - 1;
    }
    selected = searchResult[_index!];
    notifyListeners();
  }

  Future<void> select({String? arg}) async {
    if (_index == null) {
      return;
    }
    await execute(searchResult[_index!].index, arg: arg);
  }

  Future<void> search(String search) async {
    if (state == null) {
      return;
    }
    searchResult = await rust.search(obj: state!, search: search);
    selected = searchResult.firstOrNull;
    if (selected != null) {
      _index = 0;
    } else {
      _index = null;
    }
    notifyListeners();
  }

  Future<void> execute(int index, {String? arg}) async {
    state?.execute(id: index, arg: arg, onExecuted: () => exit(0));
  }
}
