import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import 'plugin_ui_service.dart';

class PluginUI extends StatelessWidget with WatchItMixin {
  const PluginUI({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget? widget =
        watchPropertyValue((PluginUIService s) => s.currentPluginUI);
    final pluginUiService = di.get<PluginUIService>();
    return Column(
      children: [
        AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              pluginUiService.showPluginUI = false;
            },
          ),
          title: const Text("PLUGIN"),
        ),
        if (widget != null) widget,
      ],
    );
  }
}

