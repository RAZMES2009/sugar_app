import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sugar_app/ui/screens/registration_screen.dart';

import '../../providers/user_data_provider.dart';

class BodySettings extends StatelessWidget {
  const BodySettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Provider.of<UserData>(context, listen: false).clearAllData();
              Navigator.of(context)
                  .popAndPushNamed(RegistrationScreen.routeName);
            },
            child: const Text(
              'Update my details',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
