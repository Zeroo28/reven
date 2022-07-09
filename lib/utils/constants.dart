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
  static const String applicationId = 'Application Id';

  static const String statusOn = 'Running';
  static const String statusOff = 'Offline';

  static const String egApplicationID = 'Eg. 123456789012345678';

  static const String details = 'Details';
  static const String state = 'State';
  static const String largeImage = 'Large Image';
  static const String largeImageKey = '$largeImage Key';
  static const String largeImageText = '$largeImage Text';
  static const String smallImage = 'Small Image';
  static const String smallImageKey = '$smallImage Key';
  static const String smallImageText = '$smallImage Text';
  static const String enableStartTime = 'Enable Start Time';

  // Error messages
  static const String errDefault =
      'Please report this error on the GitHub repository by opening an issue.';
  static const String errUnknownState = 'Unknown state';
  static const String errFieldEmpty = 'This field cannot be empty.';
  static const String errInvalidApplicationID = 'Invalid application ID.';
  static const String errApplicationIdTooLong =
      'Application ID must only contain 18 characters';
  static const String errApplicationIdTooShort =
      'Your application ID is a bit too small :(';
  static const String errUseOfFakeId = 'That was only an example >.<';
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
