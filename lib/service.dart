import 'package:flutter/material.dart';

import 'rust_helper.dart';
import 'src/rust/api/core.dart' as r;

class Service extends ChangeNotifier {
  r.StateApp state;
  List<r.Entity> entities = [];
  List<r.Entity> commands = [];
  late Stream<r.DartAction> stream;

  int? _index;
  r.Entity? selected;

  get index => _index;

  Service(this.state) {
    _init();
  }

  Future<void> _init() async {
    commands = await state.getCommands();
    await search("");
    stream = r.setDartActionStream();
    stream.listen((event) {
      if (event == r.DartAction.exit) {
        // exit(0);
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

  Future<RunEntityResult> runSelectedEntity({String? arg}) async {
    if (selected == null) {
      return RunEntityResultNone();
    }
    return await run(selected!.index, arg: arg);
  }

  Future<void> search(String search) async {
    entities = await r.search(obj: state, search: search);

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

  Future<void> clickableComponent(
    int index,
    String action, {
    String? arg,
  }) async {
    // windowManager.hide();
    await state.componentClickable(
      id: index,
      action: action,
    );
  }

  Future<RunEntityResult> run(int index, {String? arg}) async {
    // windowManager.hide();
    final response = await state.execute(
        id: index,
        arg: arg,
        onExecuted: () async {
          // exit(0);
        });

    return response.intoRunEntityResult(index, this);
  }
}
