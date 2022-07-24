import 'package:flutter/material.dart';

import '../../../utils/constants/strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(Strings.settings),
      ),
    );
  }
}
