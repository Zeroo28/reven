import 'package:flutter/material.dart';

class Strings {
  static const String about = 'About';
  static const String appName = 'Discord RPC Client';
  static const String exit = 'Exit';
  static const String helloWorld = 'Hello World';
  static const String home = 'Home';
  static const String settings = 'Settings';
  static const String discord = 'Discord';
  static const String discordRpc = 'Discord RPC';
  static const String rpc = 'Rich Presence';
  static const String status = 'Status';
  static const String cancel = 'Cancel';
  static const String continue_ = 'Continue';

  static const String statusOn = 'Running';
  static const String statusOff = 'Offline';

  // Error messages
  static const String errDefault =
      'Please report this error on the GitHub repository by opening an issue.';
  static const String errUnknownState = 'Unknown state';
}

class PColors {
  static Color success = const Color(0xFF27AE60);
  static Color error = const Color(0xFFeb5757);
}

class Integers {
  static const double winMaxHeight = 720;
  static const double winMaxWidth = 1080;
}

class Keys {
  static const String firstRun = 'firstRun';
}

class Configurations {
  static const defaultRpcApplicationID = '989352288466386964';
}

class Routes {
  static const String home = '/';
  static const String addApp = '/addApp';
  static const String settings = '/settings';
}
