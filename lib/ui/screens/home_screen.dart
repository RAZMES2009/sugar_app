import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sugar_app/helper/json_helper.dart';

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
            onPressed: () =>
                Navigator.of(context).pushNamed(SettingsScreen.routeName),
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
