import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'order-card.dart';
import 'pending-order.provider.dart';

class PendingOrder extends StatefulWidget {
  PendingOrder({Key key}) : super(key: key);
  @override
  _PendingOrder createState() => _PendingOrder();
}

class _PendingOrder extends State<PendingOrder> {
  PendingOrderProvider _pendingOrderProvider;
  @override
  void initState() {
    super.initState();
    PendingOrderProvider pendingOrderProvider =
        Provider.of<PendingOrderProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => pendingOrderProvider.getPendingAppointments());
  }

  @override
  Widget build(BuildContext context) {
    _pendingOrderProvider = Provider.of<PendingOrderProvider>(context);
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _pendingOrderProvider.pendingOrders.length,
        itemBuilder: (BuildContext context, int index) {
          return OrderCard(
            orderItem: _pendingOrderProvider.pendingOrders[index],
          );
        });
  }
}
