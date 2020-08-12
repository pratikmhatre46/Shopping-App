import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavorite;
  Product({
    @required this.title,
    @required this.imageUrl,
    @required this.id,
    @required this.description,
    this.isFavorite = false,
    @required this.price,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
