import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);
  @override
  _Profile createState() => _Profile();
}
class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile'));
  }
}