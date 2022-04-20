import 'package:flutter/material.dart';

class TopMessage extends StatelessWidget {
  final String message;
  const TopMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 45),
          child: Container(
            width: mediaQuerySize.width * 0.8,
            height: mediaQuerySize.height * 0.1,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
