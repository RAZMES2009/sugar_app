import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sugar_app/helper/json_helper.dart';

import '../screens/user_allowance_screen.dart';
import '../../providers/user_provider.dart';
import './choice_gender.dart';
import './forms_data_user.dart';
import './choice_activity.dart';

class DataFields extends StatelessWidget {
  const DataFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    final userData = Provider.of<Users>(context);
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final weightController = TextEditingController();
    final heightController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return FutureBuilder(
        future: JsonHelper.storage.ready,
        builder: (ctx, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SizedBox(
            height: mediaQuerySize.height * 0.5,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'My data',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FomsDataUser(controller: nameController, type: 'Name'),
                      FomsDataUser(controller: ageController, type: 'Age'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FomsDataUser(
                          controller: weightController, type: 'Weight'),
                      FomsDataUser(
                          controller: heightController, type: 'Height'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ChoiceGender(),
                      ChoiceActivity(),
                    ],
                  ),
                  SizedBox(
                    width: mediaQuerySize.width * 0.6,
                    height: mediaQuerySize.height * 0.05,
                    child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          userData.createUser(
                            name: nameController.text,
                            ageString: ageController.text,
                            weightString: weightController.text,
                            heightString: heightController.text,
                          );
                          Navigator.popAndPushNamed(
                              context, UserAllowanceScreen.routeName);
                        }
                      },
                      child: const Text('Next'),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
