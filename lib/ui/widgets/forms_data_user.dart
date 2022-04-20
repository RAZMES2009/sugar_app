import 'package:flutter/material.dart';

class FomsDataUser extends StatelessWidget {
  final String type;
  final TextEditingController controller;

  const FomsDataUser({
    Key? key,
    required this.type,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: mediaQuerySize.width * 0.4,
        child: TextFormField(
          controller: controller,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter data';
            }
            if (type == 'Name' &&
                value.contains(RegExp(r'[0-9\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+='
                    "'"
                    ']'))) {
              return 'Please enter correct data';
            }
            if ((type == 'Age' ||
                type == 'Weight' ||
                type == 'Height') && value.contains('-')) {
              return 'Please enter correct data';
            }
            if ((type == 'Age' ||
                type == 'Weight' ||
                type == 'Height') && value.contains(',')) {
              return 'Please use \'.\' instead of \',\'';
            }
            return null;
          },
          keyboardType:
              type == 'Name' ? TextInputType.name : TextInputType.number,
          decoration: InputDecoration(
            fillColor: Theme.of(context).colorScheme.primary,
            filled: true,
            hintText: type == 'Name' || type == 'Age'
                ? type
                : type == 'Weight'
                    ? type + ' (kg)'
                    : type + ' (cm)',
            contentPadding: const EdgeInsets.only(left: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
