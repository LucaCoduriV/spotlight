import 'package:flutter/material.dart';

import 'service.dart';
import 'src/rust/api/core.dart' as r;

/// This file needs to be refactor

extension FromRustToDart on r.BlazyrEntityActionResponse {
  RunEntityResult intoRunEntityResult(int entityIndex, Service service) {
    switch (this) {
      case r.BlazyrEntityActionResponse_Ui(:final field0):
        final widget = rComponentToFlutterWidget(field0, entityIndex, service);
        return RunEntityResultUI(widget);
      case r.BlazyrEntityActionResponse_Text():
        return RunEntityResultText();
      case r.BlazyrEntityActionResponse_None():
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

Widget rComponentToFlutterWidget(
    r.BlazyrComponent component, int index, Service service) {
  callback(r.BlazyrComponent component) =>
      rComponentToFlutterWidget(component, index, service);
  return switch (component) {
    r.BlazyrComponent_Column(:final children) => Column(
        children: [for (final child in children!) callback(child)],
      ),
    r.BlazyrComponent_Row(:final children!) => Row(
        children: [for (final child in children) callback(child)],
      ),
    r.BlazyrComponent_Container(:final child) => Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.all(2.0),
        color: Colors.red,
        child: child != null ? callback(child) : null,
      ),
    r.BlazyrComponent_Clickable(:final child, :final onClick) =>
      GestureDetector(
        onTap: () {
          if (onClick != null) {
            service.clickableComponent(index, onClick);
          }
        },
        child: child != null ? callback(child) : null,
      ),
  };
}
