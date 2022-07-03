import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/home/home_cubit.dart';
import '../../../utils/constants.dart';
import 'views/first_run.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool isDebug;
  late HomeCubit _cubit;
  BuildContext? _dialogContext;

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
            _cubit.logger.d('Navigate to settings screen');
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
            onPressed: _cubit.clearConfig,
            tooltip: 'Clear config',
            child: const Icon(Icons.clear_all_rounded),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
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
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomeLoaded) {
          return _buildHeader(context, state);
        }
        if (state is HomeError) {
          return const Center(
            child: Text(
              'Please report this error on the GitHub repository by opening an issue.',
            ),
          );
        }
        return const Center(
          child: Text('Unknown state'),
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

  Widget _buildHeader(
    BuildContext ctx,
    HomeLoaded state,
  ) {
    final size = MediaQuery.of(ctx).size;
    if (state.firstRun) {
      if (_dialogContext != null) {
        _cubit.logger.d('Dialog exists');
        try {
          Navigator.pop(_dialogContext!);
          // ignore: empty_catches
        } catch (e) {}
      }
      Future.delayed(const Duration(seconds: 2), () {
        showDialog(
          context: ctx,
          builder: (dialogCtx) {
            _dialogContext = dialogCtx;
            final horizontalMargin = size.width * 0.30;
            final verticalMargin = size.height * 0.1;
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: horizontalMargin,
                vertical: verticalMargin,
              ),
              child: const FirstRunView(),
            );
          },
          barrierDismissible: true,
        );
      });
    }
    return Center(
      child: Text('First run: ${state.firstRun}'),
    );
  }
}
