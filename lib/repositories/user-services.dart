import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  String collection = 'users';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUser(Map<String, dynamic> values) {
    String id = values['id'];
    print('values: $values');
    _firestore
        .collection('/users')
        .document(id)
        .setData(values)
        .then((value) => print(values));
  }

  void updateUser(Map<String, dynamic> values) {
    String id = values['id'];
    _firestore.collection(collection).document(id).updateData(values);
  }
///example
  Future<void> getUserById(String id) {
    // Food food = Food(
    //     foodId: 2,
    //     name: 'Tandoori Chicken',
    //     amount: 100,
    //     category: 'starters',
    //     image:
    //         'https://www.whiskaffair.com/wp-content/uploads/2020/05/Tandoori-Chicken-1-3.jpg',
    //     startTime: '11:00',
    //     endTime: '22:00',
    //     status: true);
    // print('>>>>>>>>>>>>> ${Food().toJson(food)}');
    // Map<String, dynamic> data = {
    //   'name': 'barbeque',
    //   'category': 'Main course',
    //   'price': 250,
    //   ' status': true,
    //   'startTime': '11:00',
    //   'endTime': '22:00'
    // };
    // try {
    //   _firestore.collection('menu').document(id).update(
    //     {
    //       'food': FieldValue.arrayRemove([data])
    //       // [data]
    //     },
    //   ).then((value) {
    //     print(
    //         '>>>>>>>>>> Successfully deleted item from database <<<<<<<<<<<<');
    //   });
    // } catch (e) {
    //   print('>>>>>>>>>>>>> error ::: $e <<<<<<');
    // }
    //_firestore.collection('menu').document(id).get();
  }
}
