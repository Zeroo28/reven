import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reven/utils/helpers/logger_helper.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../utils/constants/strings.dart';

class CustomErrorWidget extends StatefulWidget {
  final String error;
  final StackTrace? st;
  const CustomErrorWidget(this.error, {Key? key, this.st}) : super(key: key);

  @override
  State<CustomErrorWidget> createState() => _CustomErrorWidgetState();
}

class _CustomErrorWidgetState extends State<CustomErrorWidget> {
  bool enableReporting = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          Strings.errDefault,
          style: theme.textTheme.headline6,
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => setState(
                () {
                  enableReporting = true;
                  FlutterClipboard.copy('${widget.error}\n${widget.st}');
                },
              ),
              child: const Text('Copy error stack'),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: enableReporting
                  ? () => launchUrlString(
                      'https://github.com/Zeroo28/reven/issues/new?assignees=&labels=bug&template=bug_report.md&title=BUG')
                  : null,
              child: const Text('Create new Issue'),
            ),
          ],
        )
      ],
    );
  }
}
