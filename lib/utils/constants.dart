import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class Strings {
  static const String about = "About";
  static const String appName = "Discord RPC Client";
  static const String exit = "Exit";
  static const String helloWorld = "Hello World";
  static const String home = "Home";
  static const String settings = "Settings";
  static const String discord = "Discord";
  static const String discordRpc = "Discord RPC";
  static const String rpc = "Rich Presence";
  static const String status = "Status";
  static const String cancel = "Cancel";
  static const String continue_ = "Continue";

  /// Running
  static const String status1 = "Running";

  /// Offline
  static const String status2 = "Offline";

  static const String smallWinError = "Window is too small!";
}

class PColors {
  static Color success = const Color(0xFF27AE60);
  static Color error = const Color(0xFFeb5757);
}

class Integers {
  static const double minWindowWidth = 600;
  static const double minWindowHeight = 800;
  static const double gtkWindowBorderRadius = 12;
}

class Keys {
  static const String configBox = "config";
  static const String appDataBox = "applicationBox";
  static const String firstRun = 'firstRun';
}

class Configurations {
  static const windowConfig = WindowOptions(
    minimumSize: Size(
      Integers.minWindowHeight,
      Integers.minWindowWidth,
    ),
    title: Strings.discordRpc,
    fullScreen: false,
  );

  static const defaultRpcApplicationID = "989352288466386964";
}
