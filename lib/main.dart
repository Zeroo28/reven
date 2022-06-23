import 'dart:io';

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
  await GetStorage.init(StorageKeys.configBox);
  windowManager.ensureInitialized();

  final options = WindowOptions(
    minimumSize: Size(
      ProjectIntegers.minWindowHeight.toDouble(),
      ProjectIntegers.minWindowWidth.toDouble(),
    ),
    title: ProjectStrings.discordRpc,
    fullScreen: false,
  );

  bool hasGtk4Support = (await Process.run('gsettings', [
    'get',
    'org.gnome.desktop.wm.preferences',
    'titlebar-uses-system-font'
  ]))
      .stdout
      .toString()
      .trim()=='true';

  windowManager.waitUntilReadyToShow(options, () async {
    runApp(MyApp(hasGtk4Support));
  });
}

class MyApp extends StatelessWidget {
  final bool gtk4;
  const MyApp(this.gtk4, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RpcCubit>(create: (context) => RpcCubit()),
        BlocProvider<HomeCubit>(create: ((context) => HomeCubit())),
      ],
      child: Builder(builder: (ctx) {
        return ClipRRect(
          borderRadius: gtk4
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
              : BorderRadius.zero,
          child: MaterialApp(
            title: ProjectStrings.appName,
            theme: RPCTheme.lightTheme,
            home: const Home(),
          ),
        );
      }),
    );
  }
}
