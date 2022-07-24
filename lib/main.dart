import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_cubit/create_app_cubit.dart';
import 'database/app_database.dart';
import 'presentation/screens/add_app/add_app_screen.dart';
import 'presentation/screens/home/home_screen.dart';
import 'presentation/screens/settings/settings_screen.dart';
import 'presentation/theme/theme.dart';
import 'presentation/widgets/screen.dart';
import 'utils/constants/routes.dart';
import 'utils/constants/strings.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
void main() async {
  // DiscordRPC.initialize();
  final db = AppDatabase();
  runApp(DiscordRPCApp(db));

  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(720, 540);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.show();
  });
}

class DiscordRPCApp extends StatelessWidget {
  final AppDatabase db;
  const DiscordRPCApp(this.db, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ApplicationsCubit(db)..initialize())
      ],
      child: MaterialApp(
        title: Strings.appName,
        theme: RPCTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.home,
        onGenerateRoute: (settings) {
          if (settings.name == Routes.home) {
            return CupertinoPageRoute(
              builder: (context) => const Screen(HomeScreen()),
            );
          }
          if (settings.name == Routes.appDetails) {
            return CupertinoPageRoute(
              builder: (_) => const Screen(AppDetailsScreen()),
            );
          }
          if (settings.name == Routes.settings) {
            return CupertinoPageRoute(
              builder: (_) => const Screen(SettingsScreen()),
            );
          }
          return MaterialPageRoute(
            builder: (_) => const Screen(Scaffold(
              body: Center(
                child: Text('Page not found 404'),
              ),
            )),
          );
        },
        navigatorObservers: [routeObserver],
      ),
    );
  }
}
