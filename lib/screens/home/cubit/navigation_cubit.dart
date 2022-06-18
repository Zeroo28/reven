import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavHome());

  void goToHome(BuildContext ctx) {
    emit(NavHome());
    Navigator.pop(ctx);
  }

  void goToSettings(BuildContext ctx) {
    emit(NavSettings());
    Navigator.pop(ctx);
  }

  void goToAbout(BuildContext ctx) {
    emit(NavAbout());
    Navigator.pop(ctx);
  }

  void exitApplication() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      exit(0);
    });
  }
}
