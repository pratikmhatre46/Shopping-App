import 'package:provider/provider.dart';
import 'package:shoppingapp/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/provider/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFav;
  ProductsGrid(this.showFav);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showFav ? productsData.favoriteItems : productsData.listItems;
    return GridView.builder(
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(
//        id: products[index].id,
//        title: products[index].title,
//        imageUrl: products[index].imageUrl,
            ),
      ),
      itemCount: products.length,
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3 / 2,
      ),
    );
  }
}
