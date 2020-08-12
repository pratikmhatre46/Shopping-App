import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/provider/carts.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItems> products;
  final DateTime dateTime;

  OrderItem(
      {@required this.dateTime,
      @required this.id,
      @required this.products,
      @required this.amount});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addItems(List<CartItems> cartProducts, total) {
    _orders.insert(
      0,
      OrderItem(
          dateTime: DateTime.now(),
          id: DateTime.now().toString(),
          products: cartProducts,
          amount: total),
    );
    notifyListeners();
  }
}
