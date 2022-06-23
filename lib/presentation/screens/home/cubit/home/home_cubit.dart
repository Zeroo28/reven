import 'package:discord_rpc/utlis/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final logger = Logger(
    // printer: PrettyPrinter(
    //   colors: false,
    //   printEmojis: false,
    //   noBoxingByDefault: true,
    //   errorMethodCount: 0,
    // ),
  );
  late bool firstRun;
  final box = GetStorage();

  HomeCubit() : super(HomeLoading()) {
    firstRun = GetStorage().read<bool>(StorageKeys.firstRun) ?? true;
    logger.d("HomeCubit: firstRun: $firstRun");
    emit(HomeLoaded(firstRun));
  }

  void setCompletedConfig() async {
    await box.write(StorageKeys.firstRun, false);
  }
}
