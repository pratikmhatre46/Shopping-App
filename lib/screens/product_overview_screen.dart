import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/cart_screen.dart';
import 'package:shoppingapp/widget/badge.dart';
import 'package:shoppingapp/widget/product_grid.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/provider/carts.dart';
import 'package:shoppingapp/widget/app_drawer.dart';

enum FilterOption {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOption selected) {
              setState(() {
                if (selected == FilterOption.Favorites) {
                  _showFavorite = true;
                } else {
                  _showFavorite = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: Text('Favorite'),
                value: FilterOption.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOption.All,
              )
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) =>
                Badge(child: ch, value: cart.itemCount.toString()),
            child: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showFavorite),
    );
  }
}
