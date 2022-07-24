class Strings {
  static const String about = 'About';
  static const String appName = 'Reven RPC';
  static const String exit = 'Exit';
  static const String helloWorld = 'Hello World';
  static const String home = 'Home';
  static const String settings = 'Settings';
  static const String discord = 'Discord';
  static const String discordRpc = '$discord RPC';
  static const String rpc = 'Rich Presence';
  static const String status = 'Status';
  static const String cancel = 'Cancel';
  static const String continue_ = 'Continue';
  static const String applicationId = 'Application Id';
  static const String images = 'Images';
  static const String others = 'Others';

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

  static String getUsername(String path) {
    final userName = path.split('/')[2];
    return '/home/$userName/.local/share/com.example.discord_rpc';
  }
}
