import 'package:flutter/material.dart';

import '../../utlis/constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(Strings.about),
    );
  }
}
