import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class ChoiceActivity extends StatefulWidget {
  const ChoiceActivity({
    Key? key,
  }) : super(key: key);

  @override
  State<ChoiceActivity> createState() => _ChoiceActivityState();
}

class _ChoiceActivityState extends State<ChoiceActivity> {
  String dropDownValue = 'Medium';

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    final userData = Provider.of<Users>(context, listen: false);
    return SizedBox(
      width: mediaQuerySize.width * 0.3,
      child: DropdownButton(
        value: dropDownValue,
        isExpanded: true,
        icon: const Icon(Icons.arrow_downward),
        underline: Container(
          height: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
        dropdownColor: Theme.of(context).colorScheme.primary,
        items:
            ['Minimum', 'Weak', 'Medium', 'High', 'Extra'].map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropDownValue = newValue!;
            userData.setActivity(dropDownValue);
          });
        },
      ),
    );
  }
}
