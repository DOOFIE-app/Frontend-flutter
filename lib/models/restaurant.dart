import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  static const NAME = "name";
  static const ADDRESS = "address";
  static const STARTTIME = "startTime";
  static const ENDTIME = "endTime";
  static const STATUS = "status";

  String _name;
  String _address;
  String _startTime;
  String _endTime;
  bool _status;

  //getter
  String get name => _name;
  String get address => _address;
  String get startTime => _startTime;
  String get endTime => _endTime;
  bool get status => _status;

  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME] ?? null;
    _address = snapshot.data()[ADDRESS] ?? null;
    _startTime = snapshot.data()[STARTTIME] ?? null;
    _endTime = snapshot.data()[ENDTIME] ?? null;
    _status = snapshot.data()[STATUS] ?? false;
  }
}
