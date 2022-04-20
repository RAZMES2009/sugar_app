import 'package:flutter/material.dart';

import './registration_screen.dart';
import '../widgets/top_message.dart';

class AboutAppScreen extends StatelessWidget {
  static const routeName = 'about-app';

  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: mediaQuerySize.width,
        height: mediaQuerySize.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const TopMessage(
              message: 'Hello, this app will help you eat less sugar',
            ),
            const MessageWidget(
              messageTop: 'What is this for?',
              messageBody:
                  'Consuming too much sugar may lead to health issues such as obesity, diabetes, heart disease and tooth decay.',
            ),
            const MessageWidget(
              messageTop: 'Sounds bad, right?',
              messageBody:
                  'So let\'s start controlling the amount of our sugar',
            ),
            Center(
              child: SizedBox(
                width: mediaQuerySize.width * 0.6,
                height: mediaQuerySize.height * 0.05,
                child: ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: () => Navigator.of(context).pushReplacementNamed(
                    RegistrationScreen.routeName,
                  ),
                  child: const Text('Let\'s start'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final String messageTop;
  final String messageBody;
  const MessageWidget({
    Key? key,
    required this.messageTop,
    required this.messageBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: mediaQuerySize.width * 0.9,
        height: messageBody.length > 60
            ? mediaQuerySize.height * 0.2
            : mediaQuerySize.height * 0.15,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                messageTop,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                messageBody,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
