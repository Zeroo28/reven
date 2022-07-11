import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glutton/glutton.dart';
import 'package:logger/logger.dart';

import '../../utils/constants/configs.dart';

part 'config_state.dart';

class ConfigCubit extends Cubit<ConfigState> {
  final logger = Logger();

  ConfigCubit() : super(LoadingConfig());

  void initialize() async {
    try {
      final firstRun = !await Glutton.have(Keys.firstRun);
      emit(ConfigLoaded(firstRun));
    } catch (e) {
      logger.e(e);
      emit(ConfigError(e));
    }
  }

  void setCompletedConfig() async {
    try {
      await Glutton.eat(Keys.firstRun, true);
    } catch (e) {
      logger.e(e);
      emit(ConfigError(e));
    }
  }

  void clearConfig() async {
    try {
      emit(LoadingConfig());
      await Glutton.flush();
      emit(ConfigLoaded(!await Glutton.have(Keys.firstRun)));
    } catch (e) {
      logger.e(e);
      emit(ConfigError(e));
    }
  }
}
