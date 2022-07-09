import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Widget childScreen;
  const Screen(this.childScreen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoveWindow(
      child: childScreen,
    );
  }
}
