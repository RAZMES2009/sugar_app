import 'package:flutter/material.dart';

class MyFAB extends StatelessWidget {
  const MyFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(
        Icons.mode_edit_outline_outlined,
      ),
    );
  }
}
