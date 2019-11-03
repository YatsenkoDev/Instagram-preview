import 'dart:core' as core;
import 'dart:core';

class Logger {
  static void print(dynamic message) {
    if (_isInDebugMode) {
      // ignore: avoid_print
      core.print(message);
    }
  }

  static bool get _isInDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }
}
