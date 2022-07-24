import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_cubit/create_app_cubit.dart';
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
  late ApplicationsCubit _cubit;

  @override
  Widget build(BuildContext context) {
    _cubit = BlocProvider.of<ApplicationsCubit>(context);
    _theme = Theme.of(context);
    return Form(
      key: _cubit.formKey,
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
        _cubit.formKey,
        validator: Validators.validateApplicationId,
        decoration: const InputDecoration(
          labelText: Strings.applicationId,
          hintText: Strings.egApplicationID,
        ),
        validateOnSubmit: false,
        controller: _cubit.idController,
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomTextField(
              _cubit.formKey,
              decoration: const InputDecoration(
                labelText: Strings.details,
                hintText: 'Playing Squad',
              ),
              validateOnSubmit: false,
              allowEmptyValue: true,
              controller: _cubit.detailsController,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CustomTextField(
              _cubit.formKey,
              decoration: const InputDecoration(
                labelText: Strings.state,
                hintText: 'In Lobby',
              ),
              validateOnSubmit: false,
              allowEmptyValue: true,
              controller: _cubit.stateController,
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
              _cubit.formKey,
              decoration:
                  const InputDecoration(label: Text(Strings.largeImageKey)),
              allowEmptyValue: true,
              validateOnSubmit: false,
              controller: _cubit.lImgKeyController,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CustomTextField(
              _cubit.formKey,
              decoration:
                  const InputDecoration(label: Text(Strings.largeImageText)),
              allowEmptyValue: true,
              validateOnSubmit: false,
              controller: _cubit.lImgTextController,
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
              _cubit.formKey,
              decoration:
                  const InputDecoration(label: Text(Strings.smallImageKey)),
              allowEmptyValue: true,
              validateOnSubmit: false,
              controller: _cubit.sImgKeyController,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CustomTextField(
              _cubit.formKey,
              decoration:
                  const InputDecoration(label: Text(Strings.smallImageText)),
              allowEmptyValue: true,
              validateOnSubmit: false,
              controller: _cubit.sImgTextController,
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
            value: _cubit.enableStartTime,
            onToggle: (v) => setState(
              () => _cubit.enableStartTime = v,
            ),
          )
        ],
      ),
    ];
  }
}
