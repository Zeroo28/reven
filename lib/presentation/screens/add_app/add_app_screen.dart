import 'package:discord_rpc/presentation/screens/add_app/widgets/form.dart';
import 'package:flutter/material.dart';

class AddApplicationScreen extends StatelessWidget {
  const AddApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Application'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: ApplicationForm(),
      ),
    );
  }
}
