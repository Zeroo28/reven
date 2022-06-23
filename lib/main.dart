import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:window_manager/window_manager.dart';

import 'presentation/screens/home/cubit/home/home_cubit.dart';
import 'presentation/screens/home/cubit/rpc/rpc_cubit.dart';
import 'presentation/screens/home/home.dart';
import 'presentation/theme.dart';
import 'utlis/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // DiscordRPC.initialize();
  await GetStorage.init();
  windowManager.ensureInitialized();

  final options = WindowOptions(
    minimumSize: Size(
      ProjectIntegers.minWindowHeight.toDouble(),
      ProjectIntegers.minWindowWidth.toDouble(),
    ),
    title: ProjectStrings.discordRpc,
    fullScreen: false,
  );

  windowManager.waitUntilReadyToShow(options, () async {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RpcCubit>(create: (context) => RpcCubit()),
        BlocProvider<HomeCubit>(create: ((context) => HomeCubit())),
      ],
      child: MaterialApp(
        title: ProjectStrings.appName,
        theme: RPCTheme.lightTheme,
        home: const Home(),
      ),
    );
  }
}
