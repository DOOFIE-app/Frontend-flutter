import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/models/food.dart';
import 'package:restaurant_app/utilities/commons.dart';

import '../../utilities/validation.dart';

class MenuFormValidator with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ValidateFile _image = ValidateFile(null, null);
  ValidationText _itemName = ValidationText(null, null);
  ValidationText _price = ValidationText(null, null);
  ValidationText _startTime = ValidationText(null, null);
  ValidationText _endTime = ValidationText(null, null);
  ValidationText _category = ValidationText(null, null);
  ValidationText _description = ValidationText(null, null);
  bool _isLoading = false;

  List<String> _timeList = [
    '07:00 AM',
    '08:00 AM',
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
    '06:00 PM',
    '07:00 PM',
    '08:00 PM',
    '09:00 PM',
    '10:00 PM',
    '11:00 PM',
    '12:00 AM',
  ];

  ValidateFile get image => _image;
  ValidationText get itemName => _itemName;
  ValidationText get price => _price;
  ValidationText get startTime => _startTime;
  ValidationText get endTime => _endTime;
  ValidationText get category => _category;
  ValidationText get description => _description;
  bool get isLoading => _isLoading;
  List<String> get timeList => _timeList;

  bool get formValid =>
      _itemName.value != null &&
      _price.value != null &&
      _category.value != null &&
      _startTime.value != null &&
      _endTime.value != null;

  void changeImage(File image) {
    if (image != null) {
      _image = ValidateFile(image, null);
    } else {
      _image.error = 'Choose valid image';
    }
    notifyListeners();
  }

  void changeName(String value) {
    if (value.length > 1) {
      _itemName = ValidationText(value, null);
    } else {
      _itemName = ValidationText(null, 'Enter valid Service Name');
    }
    notifyListeners();
  }

  void changePrice(String value) {
    if (value.length > 1) {
      _price = ValidationText(value, null);
    } else {
      _price = ValidationText(null, 'Enter valid Price');
    }
    notifyListeners();
  }

  void changeDescription(String value) {
    if (value.isNotEmpty) {
      _description = ValidationText(value, null);
    } else {
      _description = ValidationText(null, 'Enter valid Description');
    }
    notifyListeners();
  }

  void changeCategory(String value) {
    if (value.isNotEmpty) {
      _category = ValidationText(value, null);
    } else {
      _category = ValidationText(null, 'Choose category');
    }
    notifyListeners();
  }

  void changeStartTime(String value) {
    if (value.isNotEmpty) {
      _startTime = ValidationText(value, null);
    } else {
      _startTime = ValidationText(null, 'Choose starting time');
    }
    notifyListeners();
  }

  void changeEndTime(String value) {
    if (value.isNotEmpty) {
      _endTime = ValidationText(value, null);
    } else {
      _endTime = ValidationText(null, 'Choose Ending time');
    }
    notifyListeners();
  }

  void clearForm() {
    _itemName = ValidationText(null, null);
    _price = ValidationText(null, null);
    _startTime = ValidationText(null, null);
    _endTime = ValidationText(null, null);
    _category = ValidationText(null, null);
    _description = ValidationText(null, null);
    notifyListeners();
  }

  Future<bool> addItem(String id) async {
    try {
      Food food = Food(
          foodId: 0,
          name: itemName.value,
          amount: int.parse(price.value),
          category: category.value,
          image:
              'https://www.whiskaffair.com/wp-content/uploads/2020/05/Tandoori-Chicken-1-3.jpg',
          startTime: startTime.value,
          endTime: endTime.value,
          status: true);

      Map<String, dynamic> data = Food().toJson(food);

      await _firestore.collection('menu').doc(id).update(
        {
          'food': FieldValue.arrayUnion([data])
        },
      );
      clearForm();
      Commons.events.sink.add(Event(name: RELOAD_MENU));
      print(
          '>>>>>>>>>>>>> Successfully added item to database <<<<<<<<<<<<<<<');
      return true;
    } catch (e) {
      print(
          '>>>>>>>>>>>>> Error occured during adding item : == $e == <<<<<<<<<<<<<<<');
      return false;
    }
  }
}
