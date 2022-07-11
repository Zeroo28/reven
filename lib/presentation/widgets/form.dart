import 'package:flutter/material.dart';

import '../../../../utils/constants/strings.dart';
import '../../../../utils/helpers/validators.dart';
import 'text_field.dart';
import 'switch.dart';

class ApplicationForm extends StatefulWidget {
  const ApplicationForm({Key? key}) : super(key: key);

  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  late ThemeData _theme;

  final _formKey = GlobalKey<FormState>();

  bool enableStartTime = false;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: ListView(
        children: [
          ...buildDetails(),
          const SizedBox(height: 20),
          ...buildImageDetails(),
          const SizedBox(height: 20),
          ...buildOtherDetails(),
        ],
      ),
    );
  }

  // Contains all text details about the RPC
  List<Widget> buildDetails() {
    return [
      Text(
        Strings.details,
        style: _theme.textTheme.headline6,
      ),
      CustomTextField(
        _formKey,
        validator: Validators.validateApplicationId,
        decoration: const InputDecoration(
          labelText: Strings.applicationId,
          hintText: Strings.egApplicationID,
        ),
        validateOnSubmit: false,
        tooltip: "Your application's ID",
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomTextField(
              _formKey,
              decoration: const InputDecoration(
                labelText: Strings.details,
                hintText: 'Playing Squad',
              ),
              validateOnSubmit: false,
              allowEmptyValue: true,
              tooltip: 'What are you doing?',
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CustomTextField(
              _formKey,
              decoration: const InputDecoration(
                labelText: Strings.state,
                hintText: 'In Lobby',
              ),
              validateOnSubmit: false,
              allowEmptyValue: true,
            ),
          ),
        ],
      ),
    ];
  }

  // Contains all image related details about the RPC
  List<Widget> buildImageDetails() {
    return [
      Text(
        Strings.images,
        style: _theme.textTheme.headline6,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomTextField(
              _formKey,
              decoration:
                  const InputDecoration(label: Text(Strings.largeImageKey)),
              allowEmptyValue: true,
              validateOnSubmit: false,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CustomTextField(
              _formKey,
              decoration:
                  const InputDecoration(label: Text(Strings.largeImageText)),
              allowEmptyValue: true,
              validateOnSubmit: false,
            ),
          ),
        ],
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomTextField(
              _formKey,
              decoration:
                  const InputDecoration(label: Text(Strings.smallImageKey)),
              allowEmptyValue: true,
              validateOnSubmit: false,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CustomTextField(
              _formKey,
              decoration:
                  const InputDecoration(label: Text(Strings.smallImageText)),
              allowEmptyValue: true,
              validateOnSubmit: false,
            ),
          ),
        ],
      ),
    ];
  }

  // Other details related to the RPC
  List<Widget> buildOtherDetails() {
    return [
      Text(
        Strings.others,
        style: _theme.textTheme.headline6,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(Strings.enableStartTime),
          CustomSwitchButton(
            value: enableStartTime,
            onToggle: (v) => setState(
              () => enableStartTime = v,
            ),
          )
        ],
      ),
    ];
  }
}
