import 'package:discord_rpc/presentation/screens/add_app/widgets/switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/helpers/validators.dart';
import 'text_field.dart';

class ApplicationForm extends StatefulWidget {
  const ApplicationForm({Key? key}) : super(key: key);

  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final _formKey = GlobalKey<FormState>();
  bool enableStartTime = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final size = MediaQuery.of(context);
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
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
}
