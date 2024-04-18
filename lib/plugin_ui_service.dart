import 'package:flutter/material.dart';

class PluginUIService extends ChangeNotifier {
  Widget? _currentPluginUI;
  bool _showPluginUI = false;

  set showPluginUI(bool show) {
    _showPluginUI = show;
    notifyListeners();
  }

  set currentPluginUI(Widget? widget) {
    _currentPluginUI = widget;
    notifyListeners();
  }

  Widget? get currentPluginUI => _currentPluginUI;

  bool get showPluginUI => _showPluginUI;
}
