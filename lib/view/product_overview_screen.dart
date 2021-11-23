import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/providers/Products.dart';
import 'package:shopp_app/providers/cart.dart';
import 'package:shopp_app/providers/product.dart';
import 'package:shopp_app/widget/badge.dart';
import 'package:shopp_app/widget/products_grid_widget.dart';

import 'cart_screen.dart';

enum FilterOption { _favorite, _all }

class ProductOverviewScreen extends StatefulWidget {
  ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (selectedItem) {
              setState(() {
                if (selectedItem == FilterOption._favorite) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Show Favorites Only'),
                value: FilterOption._favorite,
              ),
              const PopupMenuItem(
                child: Text('Show All'),
                value: FilterOption._all,
              ),
            ],
            child: Icon(Icons.more_vert),
          ),

          ///
          /// az child e builder estefade kardim inbar!chera?!!
          /// chon niaz nabood har seri ba emale notifyListener child az no sakhte beshe
          /// dar vaghe kharej az builder child sakhte shode
          Consumer<Cart>(
            builder: (ctx, cart, ch) => Badge(
                child: ch!,
                value: cart.itemCounts.toString(),
                color: Theme.of(context).accentColor),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routName);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ProductsGridWidget(showOnlyFavorites: _showOnlyFavorites),
      ),
    );
  }
}
