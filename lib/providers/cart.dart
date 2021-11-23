import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCounts {
    return _items.length;
  }

  double get totalPrice {
    double tmp = 0.0;
    _items.forEach((key, value) {
      tmp += value.quantity * value.price;
    });

    return tmp;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCart) => CartItem(
              id: existingCart.id,
              title: existingCart.title,
              quantity: existingCart.quantity + 1,
              price: existingCart.price));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }

    notifyListeners();
  }

  void deleteItem(String id) {
    print('delete id: $id');
    _items.remove(id);
    notifyListeners();
  }
}
