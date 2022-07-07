import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

typedef StringValidator = String? Function(String?)?;
typedef VoidFunction = void Function();

class CustomTextField extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final StringValidator? validator;
  final InputDecoration? decoration;
  final bool allowEmptyValue;
  final bool validateOnSubmit;
  final int? maxLength;
  final TextInputType keyboardType;

  const CustomTextField(
    this.formKey, {
    Key? key,
    this.validator,
    this.allowEmptyValue = false,
    this.validateOnSubmit = true,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.decoration,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();

  String? defaultValidator(String? value) {
    if (!allowEmptyValue && (value == null || value.isEmpty)) {
      return Strings.errFieldEmpty;
    }
    return null;
  }
}

class _CustomTextFieldState extends State<CustomTextField> {
  late StringValidator _validator;

  @override
  void initState() {
    super.initState();
    _validator = widget.validator ?? widget.defaultValidator;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: _validator,
      onFieldSubmitted: widget.validateOnSubmit
          ? (_) => widget.formKey.currentState?.validate()
          : null,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      decoration: widget.decoration,
    );
  }
}
