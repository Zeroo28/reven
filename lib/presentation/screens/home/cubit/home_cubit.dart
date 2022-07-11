import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glutton/glutton.dart';
import 'package:logger/logger.dart';

import '../../../../utils/constants/constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final logger = Logger();

  HomeCubit() : super(HomeLoading());

  void initialize() async {
    try {
      final firstRun = !await Glutton.have(Keys.firstRun);
      emit(HomeLoaded(firstRun));
    } catch (e) {
      logger.e(e);
      emit(HomeError(e));
    }
  }

  void setCompletedConfig() async {
    try {
      await Glutton.eat(Keys.firstRun, true);
    } catch (e) {
      logger.e(e);
      emit(HomeError(e));
    }
  }

  void clearConfig() async {
    try {
      emit(HomeLoading());
      await Glutton.flush();
      emit(HomeLoaded(!await Glutton.have(Keys.firstRun)));
    } catch (e) {
      logger.e(e);
      emit(HomeError(e));
    }
  }

  // void openDiscordApplicationUrl(LinkableElement url) async {
  //   try {
  //     final uri = Uri.parse(url.url);
  //     if (await canLaunchUrl(uri)) {
  //       await launchUrl(uri);
  //     }
  //   } catch (e) {
  //     logger.e(e);
  //     emit(HomeError(e));
  //   }
  // }
}
