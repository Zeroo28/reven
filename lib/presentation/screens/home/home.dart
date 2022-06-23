import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../utlis/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final logger = Logger(
      printer: PrettyPrinter(
    colors: false,
    printEmojis: false,
    noBoxingByDefault: true,
    errorMethodCount: 0,
  ));

  @override
  Widget build(BuildContext context) {
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
            logger.d('Navigate to settings screen', null, null);
          },
          iconSize: 32,
          icon: Icon(
            Icons.settings,
            color: (theme.buttonTheme.colorScheme?.background ??
                    theme.textTheme.bodyText1?.color)
                ?.withOpacity(.7),
          ),
        ),
      ),
      body: _buildBody(theme, context, size),
    );
  }

  Widget _buildBody(ThemeData theme, BuildContext context, Size size) {
    return ListView(
      children: [
        _buildHeader(theme, context, size),
      ],
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return RichText(
      overflow: TextOverflow.fade,
      text: TextSpan(
        text: ProjectStrings.discord,
        style: theme.appBarTheme.titleTextStyle?.copyWith(
          color: theme.colorScheme.onBackground,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: " ${ProjectStrings.rpc}",
            style: theme.appBarTheme.titleTextStyle?.copyWith(
              color: theme.colorScheme.onBackground,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, BuildContext ctx, Size size) {
    final random = Random().nextBool();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36),
      child: Column(
        children: [
          Text(
            ProjectStrings.status,
            style: theme.textTheme.headline5?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: size.width * .3,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                random ? ProjectStrings.status1 : ProjectStrings.status2,
                style: theme.textTheme.headline1?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            color: random ? ProjectColors.success : theme.primaryColorDark,
            height: 4,
            width: size.width * .25,
          ),
        ],
      ),
    );
  }
}
