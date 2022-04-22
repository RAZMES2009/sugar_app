import 'package:flutter/material.dart';

class CardProductAte extends StatelessWidget {
  final Map userAteHistory;
  const CardProductAte({
    Key? key,
    required this.userAteHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.12,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userAteHistory['name'],
                style: const TextStyle(fontSize: 20),
              ),
              const Divider(
                thickness: 1,
                indent: 25,
                endIndent: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    userAteHistory['time'],
                  ),
                  Text(
                    'sugar: ${userAteHistory['sugar']} g / cal: ${userAteHistory['calory']} cal',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
