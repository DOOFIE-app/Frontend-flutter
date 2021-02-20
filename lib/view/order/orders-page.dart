import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/commons.dart';
import 'pending-order.dart';

class OrdersPage extends StatefulWidget {
  OrdersPage({Key key}) : super(key: key);
  @override
  _Order createState() => _Order();
}

class _Order extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          alignment: FractionalOffset.center,
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  'Pending Orders',
                  style: TextStyle(
                      color: Commons.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(color: Commons.greyColor2),
                    borderRadius: BorderRadius.circular(40)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/completed-orders');
                  },
                  child: Row(
                    children: [
                      Text(
                        ' Completed Orders',
                        style: TextStyle(
                            color: Commons.textColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(CupertinoIcons.forward)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        PendingOrder(),
      ],
    );
  }
}
