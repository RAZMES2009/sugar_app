import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/user_data_provider.dart';
import './card_product_ate.dart';

class AteTodayWidget extends StatelessWidget {
  const AteTodayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context).fetchData();
    final date = DateFormat.Md().format(DateTime.now());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, bottom: 20),
          child: Text(
            'You ate today',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView.builder(
            itemCount: int.parse(userData['ateHistoryLen']),
            itemBuilder: (ctx, i) => CardProductAte(
              userAteHistory: userData['ateHistory'][date][i.toString()],
            ),
          ),
        ),
      ],
    );
  }
}
