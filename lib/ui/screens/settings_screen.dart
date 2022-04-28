import 'package:flutter/material.dart';

import '../widgets/body_settings.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = 'settings-screen';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: const BodySettings(),
    );
  }
}