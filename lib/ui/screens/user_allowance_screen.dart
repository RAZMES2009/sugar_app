import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/json_helper.dart';
import '../../providers/user_data_provider.dart';
import '../widgets/top_message.dart';

class UserAllowanceScreen extends StatelessWidget {
  static const routeName = 'user-allowance';

  const UserAllowanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const TopMessage(
              message: 'We calculated your daily allowance',
            ),
            const MaxMessageWidget(
              messageTop: 'Max sugar per day:',
              isSugarInfo: true,
            ),
            const MaxMessageWidget(
              messageTop: 'Max calory per day:',
              isSugarInfo: false,
            ),
            Center(
              child: SizedBox(
                width: mediaQuerySize.width * 0.6,
                height: mediaQuerySize.height * 0.05,
                child: ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: () {},
                  child: const Text('Next'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MaxMessageWidget extends StatelessWidget {
  final String messageTop;
  final bool isSugarInfo;
  const MaxMessageWidget({
    Key? key,
    required this.messageTop,
    required this.isSugarInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    return FutureBuilder(
        future: JsonHelper.storage.ready,
        builder: (ctx, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final userData = Provider.of<UserData>(context, listen: false).fetchData();
          return Center(
            child: Container(
              width: mediaQuerySize.width * 0.9,
              height: mediaQuerySize.height * 0.15,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      messageTop,
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      isSugarInfo
                          ? userData['norms']['sugar'].toString() + ' gramm'
                          : userData['norms']['calory'].toString() + ' calory',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
