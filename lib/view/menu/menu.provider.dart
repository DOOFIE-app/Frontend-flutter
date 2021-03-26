import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/food.dart';

class MenuProvider extends ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<dynamic> _foodList = [];
  List<String> _categoryList = [];

  List<dynamic> get foodList => _foodList;
  List<String> get categoryList => _categoryList;

  void getFoodList(String id) async {
    _foodList = [];
    notifyListeners();
    try {
      await _firestore.collection('menu').document(id).get().then((snapshot) {
        // print(doc.data());
        _foodList = snapshot
            .data()['food']
            .map((value) => Food.fromJson(value))
            .toList();
        // var foods = FoodList.fromSnapshot(doc);
        print('>>>>>>>>>>> data :::  $_foodList<<<<<<<<');
      });

      if (_foodList.isNotEmpty) {
        for (int i = 0; i < _foodList.length; i++) {
          if (!_categoryList.contains(_foodList[i].category)) {
            _categoryList.add(_foodList[i].category);
          }
        }
      }

      notifyListeners();
    } catch (e) {
      print('>>>>>>>>>>> error ::: $e <<<<<<<');
    }
  }
}
