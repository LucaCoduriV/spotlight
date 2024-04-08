import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:spotlight/service.dart';
import 'package:watch_it/watch_it.dart';

class PreviousIntent extends Intent {
  const PreviousIntent();
}

class PreviousAction extends Action<PreviousIntent> {
  final Service service = di.get();
  final ItemScrollController controller;
  PreviousAction(this.controller);

  @override
  Object? invoke(covariant PreviousIntent intent) {
    service.previous();
    if (service.index != null) {
      controller.scrollTo(
          index: service.index!, duration: const Duration(milliseconds: 100));
    }
    return null;
  }
}

class NextIntent extends Intent {
  const NextIntent();
}

class NextAction extends Action<NextIntent> {
  final Service service = di.get();
  final ItemScrollController controller;
  NextAction(this.controller);

  @override
  Object? invoke(covariant NextIntent intent) {
    service.next();
    if (service.index != null) {
      controller.scrollTo(
          index: service.index!, duration: const Duration(milliseconds: 100));
    }
    return null;
  }
}

class SelectEntryIntent extends Intent {
  const SelectEntryIntent();
}

class SelectEntryAction extends Action<SelectEntryIntent> {
  final Service service = di.get();
  final String? arg;
  SelectEntryAction({this.arg});

  @override
  Object? invoke(covariant SelectEntryIntent intent) {
    service.select(arg: arg);
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
