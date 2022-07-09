import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_switch/flutter_switch.dart';

typedef SwitchFunction = void Function(bool);

class CustomSwitchButton extends StatefulWidget {
  final bool value;
  final SwitchFunction onToggle;

  const CustomSwitchButton({
    Key? key,
    required this.value,
    required this.onToggle,
  }) : super(key: key);

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      value: widget.value,
      onToggle: widget.onToggle,
      
    );
  }
}
