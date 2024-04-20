import 'package:flutter/material.dart';
import 'package:spotlight/theme.dart';
import 'package:watch_it/watch_it.dart';

class BWindowFrame extends StatelessWidget with WatchItMixin {
  final Widget? child;
  final Size size;
  final Widget? topBar;
  final Widget? bottomBar;

  const BWindowFrame({
    super.key,
    this.child,
    required this.size,
    this.topBar,
    this.bottomBar,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Card(
        margin: const EdgeInsets.all(1),
        surfaceTintColor: null,
        color: CustomTheme.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 0.2, color: CustomTheme.textColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (topBar != null) topBar!,
            if (child != null) child!,
            if (bottomBar != null) bottomBar!,
          ],
        ),
      ),
    );
  }
}
