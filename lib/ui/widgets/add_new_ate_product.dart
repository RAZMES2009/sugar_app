import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sugar_app/ui/screens/home_screen.dart';

import '../../providers/user_data_provider.dart';
import '../../texts/messages.dart';

class AddingNewInfoAte extends StatefulWidget {
  const AddingNewInfoAte({Key? key}) : super(key: key);

  @override
  State<AddingNewInfoAte> createState() => _AddingNewInfoAteState();
}

class _AddingNewInfoAteState extends State<AddingNewInfoAte> {
  final _formKey = GlobalKey<FormState>();
  final nameProductController = TextEditingController();
  final sugarProductController = TextEditingController();
  final caloryProductController = TextEditingController();

  @override
  void dispose() {
    nameProductController.dispose();
    sugarProductController.dispose();
    caloryProductController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        width: mediaQuerySize.width,
        height: mediaQuerySize.height * 0.4,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildRowsTextField(
                context: context,
                mediaQuerySize: mediaQuerySize,
                type: 'Product',
                controller: nameProductController,
                message: messageProduct,
              ),
              buildRowsTextField(
                context: context,
                mediaQuerySize: mediaQuerySize,
                type: 'Sugar',
                controller: sugarProductController,
                message: messageAmountSugar,
              ),
              buildRowsTextField(
                context: context,
                mediaQuerySize: mediaQuerySize,
                type: 'Calory',
                controller: caloryProductController,
                message: messageAmountCalory,
              ),
              Center(
                child: SizedBox(
                  width: mediaQuerySize.width * 0.6,
                  height: mediaQuerySize.height * 0.05,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                        if (nameProductController.text.isNotEmpty) {
                          Provider.of<UserData>(context, listen: false)
                              .addAteProduct(
                            name: nameProductController.text,
                            time: DateTime.now().toIso8601String(),
                            sugarString: sugarProductController.text,
                            caloryString: caloryProductController.text,
                          );
                          Navigator.of(context)
                              .popAndPushNamed(HomeScreen.routeName);
                        }
                      }
                    },
                    child: const Text('Add'),
                    style: Theme.of(context).elevatedButtonTheme.style,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRowsTextField({
    required BuildContext context,
    required Size mediaQuerySize,
    required String type,
    required TextEditingController controller,
    required var message,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildTextFormField(
          context: context,
          mediaQuerySize: mediaQuerySize,
          type: type,
          controller: controller,
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Tip'),
                content: message,
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  )
                ],
              ),
            );
          },
          icon: const Icon(
            Icons.info_outline_rounded,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget buildTextFormField({
    required BuildContext context,
    required Size mediaQuerySize,
    required String type,
    required TextEditingController controller,
  }) {
    return SizedBox(
      width: mediaQuerySize.width * 0.8,
      child: TextFormField(
        controller: controller,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return null;
          }
          if (type == 'Product' &&
              value.contains(RegExp(r'[0-9\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+='
                  "'"
                  ']'))) {
            return 'Please enter correct data';
          }
          if ((type == 'Calory' || type == 'Sugar') && value.contains('-')) {
            return 'Please enter correct data';
          }
          if ((type == 'Calory' || type == 'Sugar') && value.contains(',')) {
            return 'Please use \'.\' instead of \',\'';
          }
          return null;
        },
        keyboardType:
            type == 'Product' ? TextInputType.name : TextInputType.number,
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.primary,
          filled: true,
          hintText: type,
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
    );
  }
}
