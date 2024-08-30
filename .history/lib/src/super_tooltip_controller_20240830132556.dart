import 'dart:async';

import 'package:flutter/material.dart';

import 'enums.dart';

class SuperTooltipController extends ChangeNotifier {
  late Completer _completer;
  bool _isVisible = false;
  bool get isVisible => _isVisible;
  // External control flag
  bool externalControl = false;

  late Event event;

  Future<void> showTooltip({bool external = false}) {
    externalControl = external;
    event = Event.show;
    _completer = Completer();
    notifyListeners();
    return _completer.future.whenComplete(() => _isVisible = true);
  }

  Future<void> hideTooltip({bool external = false}) {
    externalControl = external;
    event = Event.hide;
    _completer = Completer();
    notifyListeners();
    return _completer.future.whenComplete(() => _isVisible = false);
  }

  void complete() {
    if (!_completer.isCompleted) {
      _completer.complete();
    }
  }
}

