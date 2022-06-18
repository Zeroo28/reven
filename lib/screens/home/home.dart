import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/navigation_cubit.dart';
import '../about/about.dart';
import '../settings/settings.dart';
import '../../utlis/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<NavigationCubit>(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is NavHome) {
            return buildHome();
          } else if (state is NavSettings) {
            return const SettingsScreen();
          } else if (state is NavAbout) {
            return const AboutScreen();
          } else {
            return buildErrorWidget();
          }
        },
      ),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                color: theme.primaryColor,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(Strings.home),
              onTap: () => cubit.goToHome(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(Strings.settings),
              onTap: () => cubit.goToSettings(context),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text(Strings.about),
              onTap: () => cubit.goToAbout(context),
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text(Strings.exit),
              onTap: cubit.exitApplication,
            ),
          ],
        ),
      ),
    );
  }

  Center buildErrorWidget() {
    return const Center(
      child: Text('Unknown state, please create an issue on GitHub :C'),
    );
  }

  Widget buildHome() => const Center(child: Text(Strings.helloWorld));
}
