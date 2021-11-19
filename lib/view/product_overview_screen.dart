import 'package:flutter/material.dart';
import 'package:shopp_app/model/product.dart';
import 'package:shopp_app/widget/products_grid_widget.dart';


class ProductOverviewScreen extends StatelessWidget {
  ProductOverviewScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
      ),
      body: SafeArea(
        child: ProductsGridWidget(),
      ),
    );
  }
}

