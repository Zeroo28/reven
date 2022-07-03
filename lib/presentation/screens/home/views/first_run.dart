import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

import '../../../../utils/constants.dart';
import '../cubit/home/home_cubit.dart';

class FirstRunView extends StatelessWidget {
  const FirstRunView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.4,
      height: size.height * 0.6,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "First Run 🎉️",
                  style: theme.textTheme.headline6,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "We have noticed that this is your first time running this application. To speed up the process, we have created a few quick tips to get you started.",
                  style: theme.textTheme.bodyText1,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                ),
              ),
              Linkify(
                text:
                    'Follow this link to create your own rich presence application https://discord.com/developers/applications.',
                textAlign: TextAlign.center,
                onOpen: homeCubit.openDiscordApplicationUrl,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Application ID",
                    helperText:
                        '${Configurations.defaultRpcApplicationID} - Default',
                  ),
                  obscureText: true,
                  onChanged: (value) {},
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        child: const Text(Strings.cancel),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          homeCubit.setCompletedConfig();
                          Navigator.pop(context);
                          homeCubit.initialize();
                        },
                        child: const Text(Strings.continue_),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
