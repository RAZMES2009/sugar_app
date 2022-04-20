import 'package:flutter/material.dart';

import '../helper/json_helper.dart';

class Users with ChangeNotifier {
  Map<String, dynamic> _item = {};

  String _dropDownGender = 'Female';
  String _dropDownActivity = 'Medium';

  void setGender(value) {
    _dropDownGender = value;
    ChangeNotifier();
  }

  void setActivity(value) {
    _dropDownActivity = value;
    ChangeNotifier();
  }

  Future<void> createUser({
    required String name,
    String? gender,
    required String ageString,
    required String weightString,
    required String heightString,
    double? activity,
  }) async {
    final age = int.parse(ageString.replaceAll(' ', ''));
    final weight = double.parse(weightString.replaceAll(' ', ''));
    final height = double.parse(heightString.replaceAll(' ', ''));
    final double normCalory;
    final double activity;

    switch (_dropDownActivity) {
      case 'Minimum':
        activity = 1.2;
        break;
      case 'Weak':
        activity = 1.375;
        break;
      case 'High':
        activity = 1.725;
        break;
      case 'Extra':
        activity = 1.9;
        break;
      default:
        activity = 1.55;
        break;
    }
    gender == 'male'
        ? normCalory = (weight * 10 + height * 6.25 - age * 5 + 5) * activity
        : normCalory = (weight * 10 + height * 6.25 - age * 5 - 161) * activity;

    _item = {
      'name': name,
      'gender': _dropDownGender,
      'age': age,
      'weight': weight,
      'height': height,
      'activity': _dropDownActivity,
      'norms': {
        'calory': normCalory.round(),
        'sugar': 30,
      },
      'ate': {
        '9:00': {
          'calory': 50,
          'sugar': 5,
        },
      }
    };

    await JsonHelper.saveToStorage(_item);
    ChangeNotifier();
  }

  dynamic fetchData() {
    final data = JsonHelper.fetchData();
    return data;
  }
}
