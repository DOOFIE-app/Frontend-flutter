import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);
  @override
  _Menu createState() => _Menu();
}
class _Menu extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Menu'));
  }
}