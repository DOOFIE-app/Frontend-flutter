import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  num foodId;
  String name;
  String category;
  num amount;
  String image;
  bool status;
  String startTime;
  String endTime;

  Food(
      {this.foodId,
      this.name,
      this.category,
      this.amount,
      this.image,
      this.status,
      this.startTime,
      this.endTime});

  Food.fromJson(Map<String, dynamic> json) {
    foodId = 0;
    name = json['name'] ?? '';
    category = json['category'] ?? '';
    amount = json['price'] ?? 0;
    image = null;
    status = json['status'] ?? false;
    startTime = json['startTime'] ?? '';
    endTime = json['endTime'] ?? '';
  }

  Map<String, dynamic> toJson(Food item) {
    Map<String, dynamic> data;
    data = {
      'name': item.name,
      'category': item.category,
      'price': item.amount,
      'status': true,
      'startTime': item.startTime ?? '11:00',
      'endTime': item.endTime ?? '22:00'
    };
    return data;
  }
}

class FoodList {
  List<dynamic> _foodList;
  List<dynamic> get foodList => _foodList;
  FoodList.fromSnapshot(DocumentSnapshot snapshot) {
    List<dynamic> _demoFoodList =
        snapshot.data()['food'].map((value) => Food.fromJson(value)).toList();
    _foodList = _demoFoodList;
  }
}
