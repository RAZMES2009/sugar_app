import 'package:flutter/material.dart';

import '../widgets/data_fields.dart';
import '../widgets/top_message.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = 'register-screen';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegistrationBody(),
    );
  }
}

class RegistrationBody extends StatelessWidget {
  const RegistrationBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            TopMessage(
              message: 'Okay, you are already on the right track!',
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 20, right: 30),
              child: Text(
                'Enter your details to calculate your daily allowance',
                style: TextStyle(fontSize: 20),
              ),
            ),
            DataFields(),
          ],
        ),
      ),
    );
  }
}
