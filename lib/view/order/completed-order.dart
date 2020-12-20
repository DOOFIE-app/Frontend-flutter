import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompletedOrder extends StatefulWidget {
  CompletedOrder({Key key}) : super(key: key);
  @override
  _CompletedOrder createState() => _CompletedOrder();
}
class _CompletedOrder extends State<CompletedOrder> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body:Center(child: Text('Completed Order')));
  }
}