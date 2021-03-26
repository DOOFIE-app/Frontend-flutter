import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NAME = "name";
  static const MAIL = "mail";
  static const ID = "id";
  static const TYPE = "type";
  static const PHONE = "phone";

  String _name;
  String _mail;
  String _id;
  String _type;
  String _phone;

  //getter
  String get name => _name;
  String get mail => _mail;
  String get id => _id;
  String get type => _type;
  String get phone => _phone;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME] ?? null;
    _mail = snapshot.data()[MAIL] ?? null;
    _id = snapshot.data()[ID] ?? null;
    _type = snapshot.data()[TYPE] ?? null;
    _phone = snapshot.data()[PHONE] ?? null;
  }
}
