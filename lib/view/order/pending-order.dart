import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PendingOrder extends StatefulWidget {
  PendingOrder({Key key}) : super(key: key);
  @override
  _PendingOrder createState() => _PendingOrder();
}
class _PendingOrder extends State<PendingOrder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 50,
        itemBuilder:(BuildContext context, int index){
          return Text(index.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),);
        }
    );
  }
}