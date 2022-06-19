import 'dart:math';

import 'package:discord_rpc/utlis/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          onPressed: () {},
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
    return size.height > ProjectIntegers.minWindowHeight &&
            size.width > ProjectIntegers.minWindowWidth
        ? ListView(
            children: [
              _buildHeader(theme, context, size),
            ],
          )
        : Center(
            child: Text(
              'Window too small!',
              style: theme.textTheme.headline3,
            ),
          );
  }

  Widget _buildTitle(ThemeData theme) {
    return RichText(
      overflow: TextOverflow.fade,
      text: TextSpan(
        text: 'Discord',
        style: theme.appBarTheme.titleTextStyle?.copyWith(
          color: theme.colorScheme.onBackground,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: ' Rich Presence',
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
            'Status',
            style: theme.textTheme.headline5?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: size.width * .3,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                random ? 'Running' : 'Invisible',
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
