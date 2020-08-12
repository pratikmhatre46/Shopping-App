import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItems {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItems({
    @required this.id,
    @required this.quantity,
    @required this.price,
    @required this.title,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItems> _items = {};
  Map<String, CartItems> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingValue) => CartItems(
              title: existingValue.title,
              price: existingValue.price,
              quantity: existingValue.quantity + 1,
              id: existingValue.id));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItems(
              price: price,
              id: DateTime.now().toString(),
              title: title,
              quantity: 1));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearItems() {
    _items = {};
    notifyListeners();
  }

  void removeSingleItem(productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
        productId,
        (existingCartItem) => CartItems(
            id: existingCartItem.id,
            price: existingCartItem.price,
            title: existingCartItem.title,
            quantity: existingCartItem.quantity - 1),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }
}
