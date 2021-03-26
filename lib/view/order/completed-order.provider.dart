import 'package:flutter/material.dart';
import 'package:restaurant_app/models/cart.dart';

import '../../models/food.dart';
import '../../models/orders.dart';

class CompletedOrderProvider extends ChangeNotifier {
  List<Order> _completedOrders = [];

  List<Order> get completedOrders => _completedOrders;

  void getCompletedAppointments() {
    _completedOrders = [
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
                    status: true,
                    startTime: '12:00',
                    endTime: '01:00'),
                count: 2)
          ],
          status: 'COMPLETED',
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
                    status: true,
                    startTime: '12:00',
                    endTime: '01:00'),
                count: 2)
          ],
          status: 'COMPLETED',
          orderDate: DateTime.now().toString()),
    ];
    notifyListeners();
  }
}
