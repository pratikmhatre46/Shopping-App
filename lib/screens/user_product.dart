import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/provider/products.dart';
import 'package:shoppingapp/widget/app_drawer.dart';
import 'package:shoppingapp/widget/user_product_item.dart';
import 'package:shoppingapp/screens/edit_product_screen.dart';

class UserProduct extends StatelessWidget {
  static const routeName = '/userProductScreen';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('YOUR PRODUCTS'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: productData.listItems.length,
            itemBuilder: (_, i) => Column(
                  children: <Widget>[
                    UserProductItem(
                      title: productData.listItems[i].title,
                      imageUrl: productData.listItems[i].imageUrl,
                    ),
                    Divider(),
                  ],
                )),
      ),
    );
  }
}
