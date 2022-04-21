import 'package:flutter/material.dart';

const String messageProduct = 'Enter name product which you ate';
const String messageAmountSugar =
    'Look on the label for \'sugars\' or \'of which sugars\', both of which you\'ll find under the \'carbohydrate\' entry on the nutrition label.  This tells you how much sugar is in that product per 100g.';
Widget messageAmountCalory = Column(
  children: const [
    Text('1. Locate the nutrition facts on the item\'s packaging'),
    Text(
        '2. Note the amount of protein, carbohydrates, and fat contained in the item'),
    Text('3. Multiply each macronutrient by its caloric equivalent'),
  ],
);
