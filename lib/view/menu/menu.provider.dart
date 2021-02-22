import 'package:flutter/material.dart';

import '../../models/food.dart';

class MenuProvider extends ChangeNotifier {
  List<Food> _foodList = [];
  List<String> _categoryList = [];

  List<Food> get foodList => _foodList;
  List<String> get categoryList => _categoryList;

  void getFoodList() {
    _foodList = [
      Food(
          foodId: 1,
          name: 'Tandoori Chicken',
          categoryName: 'starters',
          image:
              'https://www.whiskaffair.com/wp-content/uploads/2020/05/Tandoori-Chicken-1-3.jpg',
          startTime: '',
          endTime: '',
          status: 'available'),
      Food(
          foodId: 1,
          name: 'Barbecue Chicken',
          categoryName: 'starters',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQf1kGQQcVsbEk2GThwoPLfDECqobHYSKK8A&usqp=CAU',
          startTime: '',
          endTime: '',
          status: 'available'),
      Food(
          foodId: 1,
          name: 'Kebab chicken',
          categoryName: 'starters',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN_eqsYlCsU-uo5Z8CaJSk6_tekkfnptW9rw&usqp=CAU',
          startTime: '',
          endTime: '',
          status: 'available'),
      Food(
          foodId: 1,
          name: 'Chicken Biriyani',
          categoryName: 'main course',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK_Unw9q_f7E3XM7WI7xCrgYMGeTpoRwa8DA&usqp=CAU',
          startTime: '',
          endTime: '',
          status: 'available'),
      Food(
          foodId: 1,
          name: 'Mutton Biriyani',
          categoryName: 'main course',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK_Unw9q_f7E3XM7WI7xCrgYMGeTpoRwa8DA&usqp=CAU',
          startTime: '',
          endTime: '',
          status: 'available'),
      Food(
          foodId: 1,
          name: 'Mango shake',
          categoryName: 'drinks',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw0XQ2LdbIWtSZbEoC2b5DVFrh6yi5syrBxg&usqp=CAU',
          startTime: '',
          endTime: '',
          status: 'available'),
      Food(
          foodId: 1,
          name: 'Chocolate shake',
          categoryName: 'drinks',
          image:
              'https://www.thespruceeats.com/thmb/4Vh5DSqNp94IcHGov8E7RcsiUHQ=/1000x1000/smart/filters:no_upscale()/chocolate-milkshake-4587581-hero-1-22c8a039103c413dafd75f4f4c39ddd4.JPG',
          startTime: '',
          endTime: '',
          status: 'available'),
    ];

    if (_foodList.isNotEmpty) {
      for (int i = 0; i < _foodList.length; i++) {
        if (!_categoryList.contains(_foodList[i].categoryName)) {
          _categoryList.add(_foodList[i].categoryName);
        }
      }
    }

    notifyListeners();
  }
}
