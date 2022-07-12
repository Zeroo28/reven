import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants/configs.dart';
import '../../utils/helpers/glutton_helper.dart';
import '../../utils/helpers/logger_helper.dart';

part 'config_state.dart';

class ConfigCubit extends Cubit<ConfigState> {
  final logger = Logger();
  final _glutton = GluttonHelper();

  ConfigCubit() : super(LoadingConfig());

  void initialize() async {
    try {
      final firstRun = !await _glutton.contains(Keys.firstRun);
      emit(ConfigLoaded(firstRun));
    } catch (e) {
      logger.error(e);
      emit(ConfigError(e));
    }
  }

  void setCompletedConfig() async {
    try {
      await _glutton.save(Keys.firstRun, true);
    } catch (e) {
      logger.error(e);
      emit(ConfigError(e));
    }
  }

  void clearConfig() async {
    try {
      emit(LoadingConfig());
      await _glutton.clear();
      emit(ConfigLoaded(!await _glutton.contains(Keys.firstRun)));
    } catch (e) {
      logger.error(e);
      emit(ConfigError(e));
    }
  }
}
