import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sugar_app/helper/json_helper.dart';
import 'package:sugar_app/ui/screens/registration_screen.dart';

import './settings_screen.dart';
import '../../providers/user_data_provider.dart';
import '../widgets/norms_today.dart';
import '../widgets/ate_today_widget.dart';
import '../widgets/my_fab.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context, listen: false).fetchData();
    final getTime = Provider.of<UserData>(context, listen: false).timeDay();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTime + userData['name'] + '!',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Reset data'),
                content: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                          'If you want change data about you press button'),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Provider.of<UserData>(context, listen: false)
                              .clearAllData();
                          Navigator.of(context)
                              .popAndPushNamed(RegistrationScreen.routeName);
                        },
                        child: const Text(
                          'Reset my data',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Back'),
                  )
                ],
              ),
            ),
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: JsonHelper.storage.ready,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: NormsTodayWidget(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: AteTodayWidget(),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: const MyFAB(),
    );
  }
}
