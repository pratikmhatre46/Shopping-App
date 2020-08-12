import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/provider/carts.dart';
import 'package:shoppingapp/provider/orders.dart';
import 'package:shoppingapp/widget/cart_items.dart' as ci;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addItems(
                          cart.items.values.toList(), cart.totalAmount);
                      cart.clearItems();
                    },
                    textColor: Theme.of(context).primaryColor,
                    child: Text('ORDER NOW'),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, i) => ci.CartItems(
                    id: cart.items.values.toList()[i].id,
                    productId: cart.items.keys.toList()[i],
                    quantity: cart.items.values.toList()[i].quantity,
                    price: cart.items.values.toList()[i].price,
                    title: cart.items.values.toList()[i].title)),
          )
        ],
      ),
    );
  }
}
