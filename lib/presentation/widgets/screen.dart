import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
