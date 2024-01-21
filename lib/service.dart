import 'package:flutter/material.dart';

import 'src/rust/api/simple.dart' as rust;

class Service extends ChangeNotifier {
  rust.StateApp? state = null;
  List<rust.Entity> entities = [];

  Future<void> init() async {
    state = await rust.StateApp.newStateApp();
    await search("");
  }

  Future<void> search(String search) async {
    if (state == null) {
      return;
    }
    entities = await rust.search(obj: state!, search: search);
    notifyListeners();
  }

  Future<void> execute(int index) async {
    state?.execute(id: index);
  }
}
