import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_cubit/create_app_cubit.dart';
import '../../../utils/constants/configs.dart';
import '../../widgets/form.dart';

class AddApplicationScreen extends StatelessWidget {
  const AddApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createAppCubit = BlocProvider.of<ApplicationsCubit>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Application'),
        actions: [
          Hero(
            tag: Keys.heroSettingsTag,
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                tooltip: 'Save application',
                onPressed: createAppCubit.validateForm,
                icon: const Icon(Icons.done_rounded),
              ),
            ),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: ApplicationForm(),
      ),
    );
  }
}
