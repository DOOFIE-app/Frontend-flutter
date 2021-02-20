import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/orders.dart';
import '../../utilities/commons.dart';

class OrderCard extends StatelessWidget {
  final Order orderItem;

  const OrderCard({Key key, @required this.orderItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              color: Commons.sbColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Positioned(
            top: 85,
            right: 5,
            left: 5,
            child: Divider(
              thickness: .4,
              color: Colors.grey,
            ),
          ),
          Positioned(
              top: 97,
              right: 10,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  'view order details >',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Positioned(
            top: 10,
            right: 10,
            child: Text(
              DateFormat.yMMMEd().format(DateTime.parse(orderItem.orderDate)),
              style: TextStyle(
                color: Commons.textColor,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: Text(
              orderItem.name,
              style: TextStyle(
                color: Commons.textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (orderItem.status == 'WAITING_FOR_APPROVAL')
            Positioned(
              top: 60,
              left: 10,
              child: Text(
                'waiting for approval',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (orderItem.status == 'WAITING_FOR_APPROVAL')
            Positioned(
                top: 50,
                right: 90,
                child: Icon(
                  Icons.check_circle_outline,
                  size: 30,
                  color: Colors.green,
                )),
          Positioned(
              top: 50,
              right: 50,
              child: Icon(
                Icons.cancel_outlined,
                size: 30,
                color: Colors.red,
              )),
          Positioned(
              top: 50,
              right: 10,
              child: Icon(
                Icons.call_outlined,
                size: 30,
                color: Colors.blue,
              )),
          if (orderItem.status == 'ACCEPTED')
            Positioned(
                top: 45,
                right: 90,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    'Completed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          if (orderItem.status == 'ACCEPTED')
            Positioned(
              top: 60,
              left: 10,
              child: Text(
                'accepted',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
