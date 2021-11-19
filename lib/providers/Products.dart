import 'package:flutter/material.dart';
import 'package:shopp_app/model/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://m.media-amazon.com/images/I/71dxfuHboNL._AC_UX385_.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://sc04.alicdn.com/kf/Uc5cfbe90ab0c4b9cb11ee8f96c1250b8l.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl: 'https://m.media-amazon.com/images/I/71SolHR0cvL._SY500_.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://m.media-amazon.com/images/I/819hzZIFNuL._AC_SX466_.jpg',
    ),
  ];

  /// چرا به این شکل ؟! چرت کل لیستو مستقیم برنگردوندیم؟
  /// چون زبان ما دارته و وقتی کل لیستو برگردونیم یعنی یه دسترسی به آدرس لیست اصلی دادیم و همه تغییرات مستقیم رو لیست اصلی اعمال میشه!
  /// برای همین موضوع ما فقط محتویات رو به صورت یک لیست استخراج میکنیم.
  List<Product> get items => [..._items];

  void add_product(Product value) {
    // _items.add(value);
    notifyListeners();
  }
}
