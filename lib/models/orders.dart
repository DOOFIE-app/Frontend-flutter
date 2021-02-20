import 'cart.dart';

class Order {
  final num orderId;
  final String name;
  final String address;
  final String contactNumber;
  final List<Cart> orderItems;
  final String status;
  final String orderDate;

  Order({this.orderId, this.name, this.address, this.contactNumber, this.orderItems, this.status, this.orderDate});
}