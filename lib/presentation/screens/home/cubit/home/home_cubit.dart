import 'package:discord_rpc/utlis/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final logger = Logger();
  final box = GetStorage(StorageKeys.configBox);
  late bool firstRun;

  HomeCubit() : super(HomeLoading()) {
    firstRun = box.read<bool>(StorageKeys.firstRun) ?? true;
    logger.d("HomeCubit: firstRun: $firstRun");
    emit(HomeLoaded(firstRun));
  }

  void setCompletedConfig() async {
    await box.write(StorageKeys.firstRun, false);
  }

  void clearConfig() async {
    await box.erase();
    emit(const HomeLoaded(true));
  }
}
