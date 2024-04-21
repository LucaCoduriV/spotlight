import 'package:flutter/material.dart';
import 'package:spotlight/main.dart';
import 'package:spotlight/widgets/bottom_bar.dart';
import 'package:spotlight/widgets/search_bar.dart';
import 'package:spotlight/widgets/window_frame.dart';
import 'package:watch_it/watch_it.dart';

class PluginScreen extends StatefulWidget with WatchItStatefulWidgetMixin {
  final Widget child;
  const PluginScreen({super.key, required this.child});

  @override
  State<PluginScreen> createState() => _PluginScreenState();
}

class _PluginScreenState extends State<PluginScreen> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BWindowFrame(
      size: windowSize,
      topBar: BSearchBar(
        textController: textController,
        showBackButton: true,
      ),
      bottomBar: const BBottomBar(),
      child: widget.child,
    );
  }
}
