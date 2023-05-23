import 'package:flutter/material.dart';

import '../../../utils/constants/strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.settings)),
      body: const Center(
        child: Text(Strings.settings),
      ),
    );
  }
}
