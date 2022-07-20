import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/presence.dart';
import '../../utils/helpers/logger_helper.dart';

part 'create_app_state.dart';

class CreateAppCubit extends Cubit<CreateAppState> {
  CreateAppCubit() : super(LoadingApplication());

  final _logger = Logger();

  void saveApplication(Presence application) {}

  void getApplication(int applicationId) async {
    // final res = await _helper.contains(applicationId.toString());
    // _logger.debug(res);
  }

  void deleteApplication(int applicationId) {}

  void validateForm(GlobalKey<FormState> formKey, Presence application) {}
}
