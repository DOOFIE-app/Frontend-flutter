import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/restaurant.dart';
import '../models/user.dart';

class SessionProvider with ChangeNotifier {
  String userCollection = 'users';
  String restaurantCollection = 'restaurant';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserModel _userSession;
  RestaurantModel _restaurantSession;

  UserModel get userSession => _userSession;
  RestaurantModel get restaurantSession => _restaurantSession;

  void initiateSession(String id) async {
    _userSession = await getUserById(id);
    _restaurantSession = await getRestaurantById(id);
    notifyListeners();
  }

  Future<UserModel> getUserById(String id) async {
    UserModel doc;
    var value = await _firestore.collection(userCollection).document(id).get();
    doc = UserModel.fromSnapshot(value);
    return doc;
  }

  Future<RestaurantModel> getRestaurantById(String id) async {
    RestaurantModel doc;
    var value =
        await _firestore.collection(restaurantCollection).document(id).get();
    doc = RestaurantModel.fromSnapshot(value);
    return doc;
  }
}
