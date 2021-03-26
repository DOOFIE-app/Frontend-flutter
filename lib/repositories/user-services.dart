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

  // Future<void> getUserById(String id) {
  //   Food food = Food(
  //       foodId: 2,
  //       name: 'Tandoori Chicken 1',
  //       amount: 200,
  //       category: 'starters',
  //       image:
  //           'https://www.whiskaffair.com/wp-content/uploads/2020/05/Tandoori-Chicken-1-3.jpg',
  //       startTime: '',
  //       endTime: '',
  //       status: true);
  //   print('>>>>>>>>>>>>> ${Food().toJson(food)}');
  //   Map<String, dynamic> data = Food().toJson(food);
  //   try {
  //     _firestore.collection('menu').doc(id).update(
  //       {
  //         'food': FieldValue.arrayUnion([data])
  //         // [data]
  //       },
  //     );
  //   } catch (e) {}
  //   //_firestore.collection('menu').document(id).get();
  // }
}
