import 'package:flutter/material.dart';

class MenuForm extends StatefulWidget {
  @override
  _MenuFormState createState() => _MenuFormState();
}

class _MenuFormState extends State<MenuForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Add menu item',
          style: TextStyle(
              // color: Commons.textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        // backgroundColor: Colors.white,
      ),
    );
  }
}
