import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hi, ' + userData['name'] + '!',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
      ),
      floatingActionButton: const MyFAB(),
    );
  }
}
