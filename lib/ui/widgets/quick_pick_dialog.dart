import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../screens/home_screen.dart';
import '../../providers/user_data_provider.dart';

class QuickPickDialog extends StatelessWidget {
  const QuickPickDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Quick pick'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildTextButton(
            text: 'Coffee',
            icon: Icons.coffee,
            context: context,
          ),
          buildTextButton(
            text: 'Tea',
            icon: Icons.coffee_outlined,
            context: context,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Back'),
        )
      ],
    );
  }

  TextButton buildTextButton({
    required String text,
    required IconData icon,
    required BuildContext context,
  }) {
    return TextButton.icon(
      onPressed: () {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (ctx) => ChoiceAmountSpoonsSugar(type: text),
        );
      },
      icon: Icon(
        icon,
        color: Colors.black,
      ),
      label: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

class ChoiceAmountSpoonsSugar extends StatelessWidget {
  final String type;
  const ChoiceAmountSpoonsSugar({Key? key, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('How much spoons of sugar?'),
      content: Row(
        children: [
          buildButton(0, type, context),
          buildButton(1, type, context),
          buildButton(2, type, context),
          buildButton(3, type, context),
        ],
      ),
    );
  }

  TextButton buildButton(int num, String type, BuildContext ctx) {
    return TextButton(
      onPressed: () {
        Provider.of<UserData>(ctx, listen: false).addAteProduct(
            time: DateFormat.jm().format(DateTime.now()),
            name: type == 'Coffee' ? type : 'Tea',
            sugarString: (num * 5).toString(),
            caloryString: type == 'Coffee' ? '0' : '3');
        Navigator.of(ctx).popAndPushNamed(HomeScreen.routeName);
      },
      child: Text(num.toString()),
    );
  }
}
