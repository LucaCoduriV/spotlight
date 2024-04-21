import 'package:flutter/material.dart';

import 'rust_helper.dart';
import 'src/rust/api/core.dart' as r;

class MainScreenService extends ChangeNotifier {
  r.StateApp state;
  List<r.Entity> entities = [];
  List<r.Entity> commands = [];
  late Stream<r.DartAction> stream;

  int? _selectedEntityIndex;
  r.Entity? selected;

  get selectedEntityIndex => _selectedEntityIndex;

  MainScreenService(this.state) {
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
    if (_selectedEntityIndex == null) {
      return;
    }
    if ((_selectedEntityIndex! + 1) >= entities.length + commands.length) {
      _selectedEntityIndex = 0;
    } else {
      _selectedEntityIndex = _selectedEntityIndex! + 1;
    }
    if (_selectedEntityIndex! >= entities.length) {
      selected = commands[_selectedEntityIndex! - entities.length];
    } else {
      selected = entities[_selectedEntityIndex!];
    }
    notifyListeners();
  }

  /// Select the previous item in searchResult or in entitiesCommands
  void previous() {
    if (_selectedEntityIndex == null) {
      return;
    }
    if ((_selectedEntityIndex! - 1) < 0) {
      _selectedEntityIndex = entities.length + commands.length - 1;
    } else {
      _selectedEntityIndex = _selectedEntityIndex! - 1;
    }
    if (_selectedEntityIndex! < entities.length) {
      selected = entities[_selectedEntityIndex!];
    } else {
      selected = commands[_selectedEntityIndex! - entities.length];
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
    _selectedEntityIndex = 0;
    if (entities.isEmpty) {
      selected = commands.firstOrNull;
      if (commands.isEmpty) {
        _selectedEntityIndex = null;
      }
    }
    notifyListeners();
  }

  // TODO: move this function to an other service
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
