import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class ChoiceGender extends StatefulWidget {
  const ChoiceGender({
    Key? key,
  }) : super(key: key);

  @override
  State<ChoiceGender> createState() => _ChoiceGenderState();
}

class _ChoiceGenderState extends State<ChoiceGender> {
  String dropDownValue = 'Female';

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
        items: ['Male', 'Female'].map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropDownValue = newValue!;
            userData.setGender(dropDownValue);
          });
        },
      ),
    );
  }
}
