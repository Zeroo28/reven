import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/add_app/add_app_screen.dart';
import 'presentation/screens/home/cubit/home_cubit.dart';
import 'presentation/screens/home/home_screen.dart';
import 'presentation/screens/settings/settings_screen.dart';
import 'presentation/theme.dart';
import 'utils/constants.dart';

void main() async {
  // DiscordRPC.initialize();
  runApp(const DiscordRPCApp());

  doWhenWindowReady(() {
    const initialSize = Size(720, 540);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class DiscordRPCApp extends StatelessWidget {
  const DiscordRPCApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
      ],
      child: Builder(builder: (ctx) {
        return MaterialApp(
          title: Strings.appName,
          theme: RPCTheme.lightTheme,
          initialRoute: Routes.home,
          onGenerateRoute: (settings) {
            if (settings.name == Routes.home) {
              return CupertinoPageRoute(
                builder: (context) => const HomeScreen(),
              );
            }
            if (settings.name == Routes.addApp) {
              return CupertinoPageRoute(
                builder: (_) => const AddApplicationScreen(),
              );
            }
            if (settings.name == Routes.settings) {
              return CupertinoPageRoute(
                builder: (_) => const SettingsScreen(),
              );
            }
            return MaterialPageRoute(
              builder: (_) => const Scaffold(
                body: Center(child: Text('Page not found 404')),
              ),
            );
          },
        );
      }),
    );
  }
}
