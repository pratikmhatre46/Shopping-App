import 'package:flutter/material.dart';
import 'package:shoppingapp/provider/product.dart';
import 'package:shoppingapp/screens/product_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/provider/carts.dart';

class ProductItem extends StatelessWidget {
//  final String id;
//  final String title;
//  final String imageUrl;
//  ProductItem(
//  {@required this.id, @required this.imageUrl, @required this.title});
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailsScreen.RouteName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(product.title),
            leading: Consumer<Product>(
              builder: (context, product, _) => IconButton(
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  product.toggleFavorite();
                },
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Added Item in Cart',
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cart.removeSingleItem(product.id);
                      },
                    ),
                  ),
                );
              },
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
