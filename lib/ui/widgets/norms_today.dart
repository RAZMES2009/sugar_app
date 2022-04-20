import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sugar_app/providers/user_provider.dart';

class NormsTodayWidget extends StatelessWidget {
  const NormsTodayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 20, bottom: 20),
          child: Text(
            'Your norms today',
            style: TextStyle(fontSize: 30),
          ),
        ),
        ContainerTodayNorms(),
      ],
    );
  }
}

class ContainerTodayNorms extends StatelessWidget {
  const ContainerTodayNorms({
    Key? key,
  }) : super(key: key);

  Widget buildChart(String type, BuildContext context) {
    final userNorms =
        Provider.of<Users>(context, listen: false).fetchData()['norms'];
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Text(
            type,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'Sugar'
                  ? userNorms['sugar'].toString()
                  : userNorms['calory'].toString(),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.055,
              height: MediaQuery.of(context).size.width * 0.3,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const Text('0'),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildChart('Sugar', context),
          buildChart('Calory', context),
        ],
      ),
    );
  }
}
