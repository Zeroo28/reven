import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:window_manager/window_manager.dart';

import 'presentation/screens/home/cubit/rpc_cubit.dart';
import 'presentation/screens/home/home.dart';
import 'presentation/theme.dart';
import 'utlis/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // DiscordRPC.initialize();
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
    return BlocProvider(
      create: (context) => RpcCubit(),
      child: MaterialApp(
        title: ProjectStrings.appName,
        theme: RPCTheme.lightTheme,
        home: const Home(),
      ),
    );
  }
}
