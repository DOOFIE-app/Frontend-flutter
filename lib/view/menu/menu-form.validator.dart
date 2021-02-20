import 'dart:io';

import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../../utilities/validation.dart';

class MenuFormValidator with ChangeNotifier {
  ValidateFile _image = ValidateFile(null, null);
  ValidationText _serviceName = ValidationText(null, null);
  ValidationOptions _gender = ValidationOptions(['male', 'female'], null);
  ValidationText _price = ValidationText(null, null);
  ValidationText _time = ValidationText(null, null);
  ValidationText _hours = ValidationText(null, null);
  ValidationText _minutes = ValidationText(null, null);
  ValidationText _category = ValidationText(null, null);
  ValidationText _newcategory = ValidationText(null, null);
  ValidationText _description = ValidationText(null, null);
  bool isLoading = false;
  List<ListCategory> categoryList;
  List<num> servicesCount;

  //Getters
  ValidationText get serviceName => _serviceName;
  ValidationOptions get gender => _gender;
  ValidationText get price => _price;
  ValidationText get time => _time;
  ValidationText get hours => _hours;
  ValidationText get minutes => _minutes;
  ValidationText get category => _category;
  ValidationText get newcategory => _newcategory;
  ValidationText get description => _description;
  ValidateFile get image => _image;

  void changeName(String value) {
    if (value.length > 1) {
      _serviceName = ValidationText(value, null);
    } else {
      _serviceName = ValidationText(null, 'Enter valid Service Name');
    }
    notifyListeners();
  }

  void changeGender(String value) {
    if (value.length > 1) {
      _gender.select(value);
    } else {
      _gender.error = 'Choose Gender';
    }
    notifyListeners();
  }

  void changeImage(File image) {
    if (image != null) {
      _image = ValidateFile(image, null);
    } else {
      _image.error = 'Choose valid image';
    }
    notifyListeners();
  }

  void changeCategory(String value) {
    if (value.length > 1) {
      _category = ValidationText(value, null);
    } else {
      _category = ValidationText(null, 'Choose category');
    }
    notifyListeners();
  }

  void changeNewCategory(String value) {
    if (value.length > 1) {
      _newcategory = ValidationText(value, null);
      _category = ValidationText(null, null);
    } else {
      _newcategory = ValidationText(null, 'Enter category');
      _category = ValidationText(null, null);
    }
    notifyListeners();
  }

  void changeDescription(String value) {
    if (value.length > 1) {
      _description = ValidationText(value, null);
    } else {
      _description = ValidationText(null, 'Enter valid Description');
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

  void changeHours(String value) {
    if (value.isNotEmpty) {
      _hours = ValidationText(value, null);
    } else {
      _hours = ValidationText(null, 'Choose Hours');
    }
    notifyListeners();
  }

  void changeMinutes(String value) {
    if (value.length > 1) {
      _minutes = ValidationText(value, null);
    } else {
      _minutes = ValidationText(null, 'Choose Minutes');
    }
    notifyListeners();
  }

  bool get isValid {
    return _serviceName.isValid && _price.isValid;
  }

  void clearForm() {
    _serviceName = ValidationText(null, null);
    _description = ValidationText(null, null);
    _price = ValidationText(null, null);
    _gender = ValidationOptions(null, null);
    _image = ValidateFile(null, null);
    _category = ValidationText(null, null);
    _newcategory = ValidationText(null, null);
    _minutes = ValidationText(null, null);
    _hours = ValidationText(null, null);
    notifyListeners();
  }

  void setLoading() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<String> submitData() async {
    setLoading();

    try {
      if (_category.value == null) {
        // await addCategory(_newcategory.value).then((newCat) => {
        //       mapCategoryWithSalon().then((value) => {
        //             if (value != null) {addService()}
        //           }),
        //     });

        stopLoading();
        return 'success';
      } else {
        // await mapCategoryWithSalon().then((value) => {
        //       if (value != null) {addService()}
        //     });

        return 'success';
      }
    } catch (e) {
      stopLoading();
      return null;
    }
  }

  // Future<void> fetchCategory() async {
  //   setLoading();
  //   try {
  //     final response = await dio.get('/categories');
  //     final _categoryList = CategoryList.fromJson(response.data);
  //     final newList = ListCategory.fromJson({'id': 0, 'name': 'Add Category'});
  //     categoryList = _categoryList.categories;
  //     categoryList.insert(0, newList);
  //     stopLoading();
  //     notifyListeners();
  //   } catch (e) {
  //     stopLoading();
  //   }
  // }

  // Future<String> addCategory(_categoryValue) async {
  //   setLoading();
  //
  //   try {
  //     // final response =
  //     //     await dio.post('/categories', data: {'name': _categoryValue});
  //     // final parsedRes = ListCategory.fromJson(response.data);
  //     // _category = ValidationText(parsedRes.id.toString(), null);
  //     // return parsedRes.id.toString();
  //   } catch (e) {
  //     stopLoading();
  //     return null;
  //   }
  // }

  // Future<String> mapCategoryWithSalon() async {
  //   setLoading();
  //
  //   try {
  //     await dio.post('/categories/salon',
  //         data: {'order': 0, 'salonId': 2, 'categoryId': _category.value});
  //     return 'success';
  //   } catch (e) {
  //     stopLoading();
  //     return null;
  //   }
  // }

  void convertTime() {
    if (hours.isValid) {
      List<String> time = [hours.value, minutes.value];
      String convertTime = time.join('.');
      final mins = convertTime * 60;
      _time = ValidationText(mins, null);
    }
  }

  void convertHrs(mins) {
    var num = mins;
    var hours = (num / 60);
    var rhours = hours.floor();
    var minutes = (hours - rhours) * 60;
    var rminutes = minutes.round();
    _hours = ValidationText('$rhours', null);
  }

  // Future<FormData> uploadImage(File file) async {
  //   final String fileName = file.path.split('/').last;
  //   final FormData formData = FormData.fromMap({
  //     'file': await MultipartFile.fromFile(file.path, filename: fileName),
  //   });
  //
  //   return formData;
  // }

  Future<String> addService() async {
    setLoading();

    try {
      // await dio.post('/services',
      //     data: {
      //       'name': _serviceName.value,
      //       'description': _description.value,
      //       'price': _price.value,
      //       'avgTime': _hours.value,
      //       'gender': _gender.value,
      //       'categoryId': _category.value,
      //       'image': uploadImage(_image.value),
      //       'salonId': 2,
      //       'order': 1
      //     },
      //     options: Options(headers: {'contentType': 'multipart/form-data'}));
      stopLoading();
      return 'success';
    } catch (e) {
      stopLoading();
      return null;
    }
  }

  Future<void> updateService(
      id, name, description, category, price, timing, image) async {
    setLoading();
    try {
      // if (category == '0') {
      // await addCategory(_newcategory.value).then((value) => {
      //       dio.put('/services', data: {
      //         'id': id,
      //         'name': name,
      //         'category': value,
      //         'description': description,
      //         'price': price,
      //         'avgTime': timing,
      //         'image': image
      //       }),
      //     });
      // } else {
      // await dio.put('/services', data: {
      //   'id': id,
      //   'name': name,
      //   'category': category,
      //   'description': description,
      //   'price': price,
      //   'avgTime': timing,
      //   'image': image
      // });
      // }

      stopLoading();
    } catch (e) {
      stopLoading();
    }
  }
}
