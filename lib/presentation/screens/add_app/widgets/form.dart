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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final size = MediaQuery.of(context);
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          Text(
            'Application ID',
            style: theme.textTheme.bodyText1,
          ),
          const SizedBox(height: 12),
          CustomTextField(
            _formKey,
            validator: Validators.validateApplicationId,
            decoration: const InputDecoration(
              hintText: Strings.fakeApplicationID,
            ),
            validateOnSubmit: false,
          )
        ],
      ),
    );
  }
}
