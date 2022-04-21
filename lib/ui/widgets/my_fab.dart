import 'package:flutter/material.dart';

import './add_new_ate_product.dart';

class MyFAB extends StatelessWidget {
  const MyFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          context: context,
          builder: (ctx) => const AddingNewInfoAte(),
        );
      },
      child: const Icon(
        Icons.mode_edit_outline_outlined,
      ),
    );
  }
}