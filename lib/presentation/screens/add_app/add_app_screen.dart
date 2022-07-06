import 'package:flutter/material.dart';

class AddApplicationScreen extends StatelessWidget {
  const AddApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).pop(),
    );
    return const Scaffold(
      body: Center(
        child: Text('Add Application'),
      ),
    );
  }
}
