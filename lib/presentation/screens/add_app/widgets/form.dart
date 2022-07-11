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
    // final size = MediaQuery.of(context);
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: ListView(
        children: [
          ...buildHead(),
          const SizedBox(height: 12),
          ...buildBody(),
          const SizedBox(height: 12),
          Text(
            Strings.others,
            style: _theme.textTheme.bodyText1,
          ),
          const SizedBox(height: 12),
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
          )
        ],
      ),
    );
  }

  // Contains all text details about the RPC
  List<Widget> buildHead() {
    return [
      Text(
        Strings.details,
        style: _theme.textTheme.bodyText1,
      ),
      CustomTextField(
        _formKey,
        validator: Validators.validateApplicationId,
        decoration: const InputDecoration(
          labelText: Strings.applicationId,
          hintText: Strings.egApplicationID,
        ),
        validateOnSubmit: false,
      ),
      const SizedBox(height: 12),
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
            ),
          ),
          const SizedBox(width: 12),
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
  List<Widget> buildBody() {
    return [
      Text(
        Strings.images,
        style: _theme.textTheme.bodyText1,
      ),
      const SizedBox(height: 8),
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
          const SizedBox(width: 12),
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
      const SizedBox(height: 12),
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
          const SizedBox(width: 12),
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
}
