import 'dart:io';

import 'package:window_manager/window_manager.dart';

class WindowEventListener with WindowListener {
  @override
  void onWindowBlur() {
    super.onWindowBlur();
    // exit(0);
  }
}
