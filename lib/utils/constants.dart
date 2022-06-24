import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class ProjectStrings {
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

  /// Running
  static const String status1 = "Running";

  /// Offline
  static const String status2 = "Offline";

  static const String smallWinError = "Window is too small!";
}

class ProjectColors {
  static Color success = const Color(0xFF27AE60);
  static Color error = const Color(0xFFeb5757);
}

class ProjectIntegers {
  static const double minWindowWidth = 600;
  static const double minWindowHeight = 800;
  static const double gtkWindowBorderRadius = 12;
}

class StorageKeys {
  static const String configBox = "config";
  static const String appDataBox = "applicationBox";
  static const String firstRun = 'firstRun';
}

class Configurations {
  static const windowConfig = WindowOptions(
    minimumSize: Size(
      ProjectIntegers.minWindowHeight,
      ProjectIntegers.minWindowWidth,
    ),
    title: ProjectStrings.discordRpc,
    fullScreen: false,
  );
}