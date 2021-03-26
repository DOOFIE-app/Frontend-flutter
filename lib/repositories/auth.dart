import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/models/user.dart';

import 'user-services.dart';

enum Status { Uninitialized, Authenticated, Unauthenticated, Authenticating }

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  final firestore = FirebaseFirestore.instance;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  //getters
  FirebaseAuth get auth => _auth;
  FirebaseUser get user => _user;
  Status get status => _status;
  UserServices get userService => _userServices;
  UserModel get userModel => _userModel;

  void changeStatus(Status value) {
    _status = value;
    notifyListeners();
  }

  Future<void> signIn(
      {@required String email, @required String password}) async {
    _status = Status.Authenticating;
    notifyListeners();
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    _status = Status.Authenticated;
    notifyListeners();
  }

  Future<bool> signUp({String email, String password}) async {
    _status = Status.Authenticating;
    notifyListeners();
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) {
        Map<String, dynamic> values = {
          UserModel.ID: value.user.uid,
          UserModel.NAME: 'User' + value.user.uid,
          UserModel.MAIL: email,
          UserModel.PHONE: '+919361144746',
          UserModel.TYPE: 'MANAGER'
        };
        _userServices.createUser(values);
      });
      _status = Status.Authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print('Error:==============>$e ');
      return false;
    }
  }

  Future<void> _onStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Uninitialized;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
}
