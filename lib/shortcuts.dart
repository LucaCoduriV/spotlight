import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:spotlight/plugin_screen.dart';
import 'package:spotlight/plugin_screen_service.dart';
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
  final PluginScreenService pluginUIService = di.get();
  final String? arg;
  final BuildContext ctx;

  SelectEntryAction({this.arg, required this.ctx});

  @override
  Object? invoke(covariant SelectEntryIntent intent) async {
    final result = await service.runSelectedEntity(arg: arg);
    switch (result) {
      case RunEntityResultUI(:final widget):
        if (ctx.mounted && widget != null) {
          Navigator.of(ctx).push(_createRoute(PluginScreen(child: widget)));
        }
        break;
      case RunEntityResultText():
      case RunEntityResultNone():
    }
    return null;
  }

  Route _createRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }
}

class PopIntent extends Intent {
  const PopIntent();
}

class PopAction extends Action<PopIntent> {
  final BuildContext ctx;
  PopAction(this.ctx);

  @override
  Object? invoke(covariant PopIntent intent) {
    if (ctx.mounted) {
      Navigator.of(ctx).pop();
    }
    return null;
  }
}
