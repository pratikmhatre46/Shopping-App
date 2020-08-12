import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/provider/carts.dart';
import 'package:shoppingapp/provider/orders.dart';
import 'package:shoppingapp/screens/product_overview_screen.dart';
import 'package:shoppingapp/screens/product_details_screen.dart';
import 'package:shoppingapp/provider/products.dart';
import 'package:shoppingapp/screens/cart_screen.dart';
import 'package:shoppingapp/screens/order_screen.dart';
import 'package:shoppingapp/screens/user_product.dart';
import 'package:shoppingapp/screens/edit_product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => Products(),
        ),
        ChangeNotifierProvider(
          builder: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          builder: (context) => Orders(),
        )
      ],
      child: MaterialApp(
        title: 'Shopping',
        theme: ThemeData(
            primarySwatch: Colors.purple, accentColor: Colors.deepOrangeAccent),
        initialRoute: '/',
        routes: {
          '/': (context) => ProductOverviewScreen(),
          ProductDetailsScreen.RouteName: (context) => ProductDetailsScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrderScreen.routeName: (context) => OrderScreen(),
          UserProduct.routeName: (context) => UserProduct(),
          EditProductScreen.routeName: (context) => EditProductScreen(),
        },
      ),
    );
  }
}
