import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/home_cubit.dart';
import '../../../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool isDebug;
  late HomeCubit _cubit;

  @override
  void initState() {
    isDebug = kDebugMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _cubit = BlocProvider.of<HomeCubit>(context);
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
          icon: Icon(
            Icons.settings,
            color: theme.buttonTheme.colorScheme?.secondary,
          ),
        ),
      ),
      body: _buildBody(theme, context, size),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'clear',
            onPressed: _cubit.clearConfig,
            tooltip: 'Clear config',
            child: const Icon(Icons.clear_all_rounded),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            heroTag: 'refresh',
            onPressed: _cubit.initialize,
            tooltip: 'Refresh',
            child: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(ThemeData theme, BuildContext context, Size size) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        _cubit.logger.d('State: $state');
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomeLoaded) {
          return _buildLoadedScreen(context, state);
        }
        if (state is HomeError) {
          return const Center(
            child: Text(Strings.errDefault),
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
        text: Strings.discord,
        style: theme.appBarTheme.titleTextStyle?.copyWith(
          color: theme.colorScheme.onBackground,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: " ${Strings.rpc}",
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
    HomeLoaded state,
  ) {
    if (state.firstRun) {
      Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pushNamed(context, Routes.addApp);
      });
    }
    return Center(
      child: Text('First run: ${state.firstRun}'),
    );
  }
}
