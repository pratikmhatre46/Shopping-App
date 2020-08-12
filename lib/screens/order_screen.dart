import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/provider/orders.dart' show Orders;
import 'package:shoppingapp/widget/app_drawer.dart';
import 'package:shoppingapp/widget/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orderScreen';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (context, i) => OrderItem(orderData.orders[i])),
    );
  }
}
