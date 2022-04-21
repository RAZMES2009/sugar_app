import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_data_provider.dart';

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
    final userData = Provider.of<UserData>(context).fetchData();
    Provider.of<UserData>(context, listen: false);
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
                  ? userData['norms']['sugar'].toString()
                  : userData['norms']['calory'].toString(),
            ),
            Chart(type: type),
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

class Chart extends StatefulWidget {
  final String type;

  const Chart({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.055,
      height: MediaQuery.of(context).size.height * 0.15,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.055,
              height: Provider.of<UserData>(context)
                  .calculateHeightChart(type: widget.type, context: context),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(44, 55, 64, 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
