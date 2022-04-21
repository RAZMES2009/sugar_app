import 'package:flutter/material.dart';

import '../helper/json_helper.dart';

class UserData with ChangeNotifier {
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
    _dropDownGender == 'Male'
        ? normCalory = (weight * 10 + height * 6.25 - age * 5 + 5) * activity
        : normCalory = (weight * 10 + height * 6.25 - age * 5 - 161) * activity;

    final normSugar = _dropDownGender == 'Male' ? 60 : 30;

    _item = {
      'name': name,
      'gender': _dropDownGender,
      'age': age,
      'weight': weight,
      'height': height,
      'activity': _dropDownActivity,
      'norms': {
        'calory': normCalory.round(),
        'sugar': normSugar,
      },
      'ateSumm': {
        'sugar': 0,
        'calory': 0,
      },
      'ateHistory': {},
    };

    await JsonHelper.saveToStorage(_item);
    ChangeNotifier();
  }

  dynamic fetchData() {
    final data = JsonHelper.fetchData();
    if (data != null && _item.isEmpty) {
      _item = data;
    }
    ChangeNotifier();
    return data;
  }

  Future<void> addAteProduct({
    required String time,
    required String name,
    required String sugarString,
    required String caloryString,
  }) async {
    final data = fetchData();
    final sugar = int.parse(sugarString);
    final calory = int.parse(caloryString);
    Map<String, Map<String, dynamic>> newProduct = {
      name: {
        'time': time,
        'sugar': sugar,
        'calory': calory,
      }
    };
    Map<String, dynamic> ateSummUser = {
      'sugar': data['ateSumm']['sugar'] + sugar,
      'calory': data['ateSumm']['calory'] + calory,
    };
    _item.update('ateHistory', ((value) => newProduct));
    _item.update('ateSumm', (value) => ateSummUser);
    await JsonHelper.saveToStorage(_item);
    ChangeNotifier();
    print(_item);
  }

  double calculateHeightChart({
    required String type,
    required BuildContext context,
  }) {
    if (_item['ateSumm']['sugar'] / _item['norms']['sugar'] > 1 ||
        _item['ateSumm']['calory'] / _item['norms']['calory'] > 1) {
      return 1;
    }
    return type == 'Sugar'
        ? MediaQuery.of(context).size.height *
            0.15 *
            (_item['ateSumm']['sugar'] / _item['norms']['sugar'])
        : MediaQuery.of(context).size.height *
            0.15 *
            (_item['ateSumm']['calory'] / _item['norms']['calory']);
  }

  Future<void> clearAllData() async {
    await JsonHelper.clearAllData();
  }
}
