import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:spotlight/service.dart';
import 'package:watch_it/watch_it.dart';

import 'src/rust/frb_generated.dart';

class PreviousIntent extends Intent {
  const PreviousIntent();
}

class PreviousAction extends Action<PreviousIntent> {
  final Service service = di.get();
  final AutoScrollController controller;
  PreviousAction(this.controller);

  @override
  Object? invoke(covariant PreviousIntent intent) {
    service.previous();
    if (service.index != null) {
      controller.scrollToIndex(service.index!,
          duration: const Duration(milliseconds: 1));
    }
    return null;
  }
}

class NextIntent extends Intent {
  const NextIntent();
}

class NextAction extends Action<NextIntent> {
  final Service service = di.get();
  final AutoScrollController controller;
  NextAction(this.controller);

  @override
  Object? invoke(covariant NextIntent intent) {
    service.next();
    if (service.index != null) {
      controller.scrollToIndex(service.index!,
          duration: const Duration(milliseconds: 1));
    }
    return null;
  }
}

class SelectEntryIntent extends Intent {
  const SelectEntryIntent();
}

class SelectEntryAction extends Action<SelectEntryIntent> {
  final Service service = di.get();
  SelectEntryAction();

  @override
  Object? invoke(covariant SelectEntryIntent intent) {
    service.select();
    return null;
  }
}

class CloseIntent extends Intent {
  const CloseIntent();
}

class CloseAction extends Action<CloseIntent> {
  CloseAction();

  @override
  Object? invoke(covariant CloseIntent intent) {
    RustLib.dispose();
    exit(0);
  }
}
