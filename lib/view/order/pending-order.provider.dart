import 'package:flutter/material.dart';
import 'package:restaurant_app/models/cart.dart';

import '../../models/food.dart';
import '../../models/orders.dart';

class PendingOrderProvider extends ChangeNotifier {
  List<Order> _pendingOrders = [];

  List<Order> get pendingOrders => _pendingOrders;

  void getPendingAppointments() {
    _pendingOrders = [
      Order(
          orderId: 1,
          name: 'Riyas',
          address: 'pallapatti',
          contactNumber: '+919361144746',
          orderItems: [
            Cart(
                food: Food(
                    foodId: 1,
                    name: 'tandoori',
                    amount: 200,
                    status: 'Available',
                    startTime: '12:00',
                    endTime: '01:00'),
                count: 2)
          ],
          status: 'WAITING_FOR_APPROVAL',
          orderDate: DateTime.now().toString()),
      Order(
          orderId: 2,
          name: 'Mani',
          address: 'pallapatti',
          contactNumber: '+919361144746',
          orderItems: [
            Cart(
                food: Food(
                    foodId: 1,
                    name: 'parota',
                    amount: 50,
                    status: 'Available',
                    startTime: '12:00',
                    endTime: '01:00'),
                count: 2)
          ],
          status: 'ACCEPTED',
          orderDate: DateTime.now().toString()),
    ];
    notifyListeners();
  }
}
