import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utilities/commons.dart';

import '../../models/food.dart';

class MenuProvider extends ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<dynamic> _foodList = [];
  List<String> _categoryList = [];

  List<dynamic> get foodList => _foodList;
  List<String> get categoryList => _categoryList;

  void getFoodList(String id) async {
    _foodList = [];
    _categoryList = [];
    notifyListeners();
    try {
      await _firestore.collection('menu').document(id).get().then((snapshot) {
        _foodList = snapshot
            .data()['food']
            .map((value) => Food.fromJson(value))
            .toList();
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

  Future<bool> deleteItem(
      {@required String id,
      @required String name,
      @required num price,
      @required String category,
      @required String startTime,
      @required String endTime,
      @required bool status}) async {
    try {
      Food food = Food(
          foodId: 0,
          name: name,
          amount: price,
          category: category,
          image:
              'https://www.whiskaffair.com/wp-content/uploads/2020/05/Tandoori-Chicken-1-3.jpg',
          startTime: startTime,
          endTime: endTime,
          status: status);

      Map<String, dynamic> data = Food().toJson(food);

      print('>>>>>>>>>>>>> data ::: $data , $id <<<<<<<<<<<<<<<<<');

      await _firestore.collection('menu').document(id).update(
        {
          'food': FieldValue.arrayRemove([data])
          // [data]
        },
      );
      Commons.events.sink.add(Event(name: RELOAD_MENU));
      print('>>>>>>>>>> Successfully deleted item from database <<<<<<<<<<<<');
      return true;
    } catch (e) {
      print('>>>>>>>>>>> error ::: $e <<<<<<<');
      return false;
    }
  }
}
