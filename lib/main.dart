import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:window_manager/window_manager.dart';

import 'presentation/screens/home/cubit/home/home_cubit.dart';
import 'presentation/screens/home/cubit/rpc/rpc_cubit.dart';
import 'presentation/screens/home/home.dart';
import 'presentation/theme.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // DiscordRPC.initialize();
  await GetStorage.init(Keys.appDataBox);
  windowManager.ensureInitialized();

  final supportsGtk4 = (await Process.run('gsettings', [
        'get',
        'org.gnome.desktop.wm.preferences',
        'titlebar-uses-system-font'
      ]))
          .stdout
          .toString()
          .trim() ==
      'true';

  windowManager.waitUntilReadyToShow(
    Configurations.windowConfig,
    () async => runApp(DiscordRPCApp(supportsGtk4)),
  );
}

class DiscordRPCApp extends StatelessWidget {
  final bool gtk4Supported;
  const DiscordRPCApp(this.gtk4Supported, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RpcCubit>(create: (context) => RpcCubit()),
        BlocProvider<HomeCubit>(create: ((context) => HomeCubit())),
      ],
      child: Builder(builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: gtk4Supported
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(Integers.gtkWindowBorderRadius),
                    bottomRight:
                        Radius.circular(Integers.gtkWindowBorderRadius),
                  )
                : BorderRadius.zero,
          ),
          clipBehavior: Clip.antiAlias,
          child: MaterialApp(
            title: Strings.appName,
            theme: RPCTheme.lightTheme,
            home: const Home(),
          ),
        );
      }),
    );
  }
}
