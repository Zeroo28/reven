import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_cubit/create_app_cubit.dart';
import '../../../utils/constants/configs.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/constants/page_routes.dart';
import '../../widgets/error.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool isDebug;
  late ApplicationsCubit _cubit;

  @override
  void initState() {
    isDebug = kDebugMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _cubit = BlocProvider.of<ApplicationsCubit>(context);
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _buildTitle(theme),
        leading: IconButton(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          splashRadius: null,
          onPressed: () {
            Navigator.pushNamed(context, Routes.settings);
          },
          iconSize: 32,
          icon: const Icon(Icons.settings),
        ),
      ),
      body: _buildBody(theme, context, size),
      floatingActionButton: FloatingActionButton(
        heroTag: Keys.heroSettingsTag,
        onPressed: () => Navigator.pushNamed(context, Routes.addApp),
        tooltip: 'Create new application',
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  Widget _buildBody(ThemeData theme, BuildContext context, Size size) {
    return BlocBuilder<ApplicationsCubit, ApplicationsState>(
      builder: (context, newState) {
        if (newState is ApplicationsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (newState is ApplicationsLoaded) {
          return _buildLoadedScreen(context, newState);
        }
        if (newState is ApplicationsError) {
          return Center(
            child: CustomErrorWidget(newState.error, st: newState.st),
          );
        }
        return const Center(
          child: Text(Strings.errUnknownState),
        );
      },
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return RichText(
      overflow: TextOverflow.fade,
      text: TextSpan(
        text: Strings.appName.split("").take(2).join(),
        style: theme.appBarTheme.titleTextStyle?.copyWith(
          color: theme.colorScheme.onBackground,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: Strings.appName.split('Re').last,
            style: theme.appBarTheme.titleTextStyle?.copyWith(
              color: theme.colorScheme.onBackground,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadedScreen(
    BuildContext ctx,
    ApplicationsLoaded state,
  ) {
    return Center(
      child: Text('First run: ${state.applications.isEmpty}'),
    );
  }
}