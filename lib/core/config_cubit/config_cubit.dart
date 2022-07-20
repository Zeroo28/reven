import 'package:discord_rpc/database/app_database.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/helpers/logger_helper.dart';

part 'config_state.dart';

class ConfigCubit extends Cubit<ConfigState> {
  final logger = Logger();

  ConfigCubit() : super(LoadingConfig());

  void initialize() async {
    try {
      final apps = await AppDatabase().getApplications;
      logger.debug('apps: $apps');
      // final firstRun = !await _glutton.contains(Keys.firstRun);
      emit(const ConfigLoaded(true));
    } catch (e) {
      logger.error(e);
      emit(ConfigError(e));
    }
  }

  void setCompletedConfig() async {
    try {
      // await _glutton.save(Keys.firstRun, true);
    } catch (e) {
      logger.error(e);
      emit(ConfigError(e));
    }
  }

  void clearConfig() async {
    try {
      emit(LoadingConfig());
      // await _glutton.clear();
      emit(const ConfigLoaded(true));
    } catch (e) {
      logger.error(e);
      emit(ConfigError(e));
    }
  }
}
