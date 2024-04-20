import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:spotlight/plugin_ui_service.dart';
import 'package:spotlight/service.dart';
import 'package:watch_it/watch_it.dart';

import 'rust_helper.dart';

class PreviousIntent extends Intent {
  const PreviousIntent();
}

class PreviousAction extends Action<PreviousIntent> {
  final MainScreenService service = di.get();
  final ItemScrollController controller;
  PreviousAction(this.controller);

  @override
  Object? invoke(covariant PreviousIntent intent) {
    service.previous();
    if (service.selectedEntityIndex != null) {
      controller.scrollTo(
          index: service.selectedEntityIndex!,
          duration: const Duration(milliseconds: 100));
    }
    return null;
  }
}

class NextIntent extends Intent {
  const NextIntent();
}

class NextAction extends Action<NextIntent> {
  final MainScreenService service = di.get();
  final ItemScrollController controller;
  NextAction(this.controller);

  @override
  Object? invoke(covariant NextIntent intent) {
    service.next();
    if (service.selectedEntityIndex != null) {
      controller.scrollTo(
          index: service.selectedEntityIndex!,
          duration: const Duration(milliseconds: 100));
    }
    return null;
  }
}

class SelectEntryIntent extends Intent {
  const SelectEntryIntent();
}

class SelectEntryAction extends Action<SelectEntryIntent> {
  final MainScreenService service = di.get();
  final PluginUIService pluginUIService = di.get();
  final String? arg;
  SelectEntryAction({this.arg});

  @override
  Object? invoke(covariant SelectEntryIntent intent) async {
    final result = await service.runSelectedEntity(arg: arg);
    switch (result) {
      case RunEntityResultUI(:final widget):
        pluginUIService.currentPluginUI = widget;
        pluginUIService.showPluginUI = true;
        break;
      case RunEntityResultText():
      case RunEntityResultNone():
    }
    return null;
  }
}

class CloseIntent extends Intent {
  const CloseIntent();
}

class CloseAction extends Action<CloseIntent> {
  CloseAction();

  @override
  Object? invoke(covariant CloseIntent intent) async {
    // exit(0);
  }
}
