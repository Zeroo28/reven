import 'dart:developer';

import 'package:flutter/foundation.dart';

class Logger {
  static final Logger _instance = Logger._internal();
  factory Logger() {
    return _instance;
  }

  Logger._internal();

  void debug(dynamic message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      log(message.toString(), error: error, stackTrace: stackTrace);
    }
  }

  void info(dynamic message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      log(message.toString(), error: error, stackTrace: stackTrace);
    }
  }

  void warn(dynamic message, {Object? error, StackTrace? stackTrace}) {
    log(message.toString(), error: error, stackTrace: stackTrace);
  }

  void error(dynamic message, {Object? error, StackTrace? stackTrace}) {
    log(message.toString(), error: error, stackTrace: stackTrace);
  }
}
