import 'package:flutter/material.dart';
import 'package:shoppingapp/provider/products.dart';
import 'package:shoppingapp/widget/product_item.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/provider/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const RouteName = '/ProductDetailsScreen';
  @override
  Widget build(BuildContext context) {
    final modelId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findByID(modelId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                '${loadedProduct.description}',
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
