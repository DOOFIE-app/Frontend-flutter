import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utilities/commons.dart';
import 'completed-order.provider.dart';
import 'order-card.dart';

class CompletedOrder extends StatefulWidget {
  CompletedOrder({Key key}) : super(key: key);
  @override
  _CompletedOrder createState() => _CompletedOrder();
}

class _CompletedOrder extends State<CompletedOrder> {
  CompletedOrderProvider _completedOrderProvider;
  @override
  void initState() {
    super.initState();
    CompletedOrderProvider completedOrderProvider =
        Provider.of<CompletedOrderProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => completedOrderProvider.getCompletedAppointments());
  }

  @override
  Widget build(BuildContext context) {
    _completedOrderProvider = Provider.of<CompletedOrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Completed Orders',
          style: TextStyle(
              color: Commons.textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _completedOrderProvider.completedOrders.length,
              itemBuilder: (BuildContext context, int index) {
                return OrderCard(
                  orderItem: _completedOrderProvider.completedOrders[index],
                );
              }),
        ],
      ),
    );
  }
}
