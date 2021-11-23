import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/providers/product.dart';
import 'package:shopp_app/providers/Products.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  // final String title;
  // final double price;
  static const String routName = '/products_details';

  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)!.settings.arguments as String;

    ///
    ///listener ro false kardim chon nemikhaim ba har taghiir ro list product e ma in widget mojaddan sakhte beshe
    ///dar vaghe ba har bar seda zadane notifyCgangeListenr in har bar sakhte nashe....
    final product = Provider.of<Products>(context, listen: false)
        .findVireById(productID as String);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
