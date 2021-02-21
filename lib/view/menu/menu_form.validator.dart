import 'dart:io';

import 'package:flutter/material.dart';

import '../../utilities/validation.dart';

class MenuFormValidator with ChangeNotifier {
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
}
