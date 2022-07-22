import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../database/app_database.dart';
import '../../database/dao/application_dao.dart';
import '../../models/presence.dart';
import '../../utils/helpers/logger_helper.dart';

part 'create_app_state.dart';

class ApplicationsCubit extends Cubit<ApplicationsState> {
  late ApplicationsDao dao;

  final logger = Logger();
  final formKey = GlobalKey<FormState>();

  // Form fields
  final idController = TextEditingController();
  final detailsController = TextEditingController();
  final stateController = TextEditingController();
  final lImgKeyController = TextEditingController();
  final lImgTextController = TextEditingController();
  final sImgKeyController = TextEditingController();
  final sImgTextController = TextEditingController();
  bool enableStartTime = false;

  ApplicationsCubit(AppDatabase db) : super(ApplicationsLoading()) {
    dao = ApplicationsDao(db);
  }

  void initialize() async {
    try {
      final applications = await dao.getApplications;
      logger.debug('Applications: ${applications[100]}');
      emit(ApplicationsLoaded(applications));
    } catch (e, st) {
      logger.error(st);
      emit(ApplicationsError(e.toString(), st));
    }
  }

  void saveApplication(Presence application) {
    dao.saveApplication(application);
  }

  void deleteApplication(int applicationId) {}

  void validateForm() {
    if (formKey.currentState!.validate()) {
      final String details = detailsController.text;
      final String state = stateController.text;
      final String largeImageKey = lImgKeyController.text;
      final String largeImageText = lImgTextController.text;
      final String smallImageKey = sImgKeyController.text;
      final String smallImageText = sImgTextController.text;

      final application = Presence(
        id: int.parse(idController.text),
        details: details.isEmpty ? null : details,
        state: state.isEmpty ? null : details,
        largeImageKey: largeImageKey.isEmpty ? null : largeImageKey,
        largeImageText: largeImageText.isEmpty ? null : largeImageText,
        smallImageKey: smallImageKey.isEmpty ? null : smallImageKey,
        smallImageText: smallImageText.isEmpty ? null : smallImageText,
        startTimeStamp: enableStartTime
            ? 0 // means current time when the app is started
            : null,
      );
      saveApplication(application);
    } else {
      logger.debug('Form not validated');
    }
  }
}
