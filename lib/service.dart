import 'package:flutter/material.dart';
import 'package:spotlight/main.dart';

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

  Future<void> clickableComponent(
    int index,
    String action, {
    String? arg,
  }) async {
    // windowManager.hide();
    await state?.componentClickable(
      id: index,
      action: action,
    );
  }

  Future<RunEntityResult> run(int index, {String? arg}) async {
    // windowManager.hide();
    final result = await state?.execute(
        id: index,
        arg: arg,
        onExecuted: () async {
          // exit(0);
        });

    switch (result) {
      case rust_core.BlazyrEntityActionResponse_Ui(:final field0):
        final widget = rComponentToFlutterWidget(field0, index, this);
        return RunEntityResultUI(widget);
      case rust_core.BlazyrEntityActionResponse_Text():
        return RunEntityResultText();
      case rust_core.BlazyrEntityActionResponse_None():
      case null:
        return RunEntityResultNone();
    }
  }
}

sealed class RunEntityResult {}

class RunEntityResultUI extends RunEntityResult {
  final Widget? widget;
  RunEntityResultUI(this.widget);
}

class RunEntityResultText extends RunEntityResult {}

class RunEntityResultNone extends RunEntityResult {}
