import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/providers/cart.dart';
import 'package:shopp_app/providers/product.dart';
import 'package:shopp_app/view/product_datil_screen.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routName, arguments: product.id);
        },
        splashColor: Colors.blue.withAlpha(30),
        child: GridTile(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: Container(
            decoration: BoxDecoration(
                color: Colors.red.withAlpha(150),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: GridTileBar(

              ///
              /// Important Important Important
              /// Chera Consumer?!!!!!!!!!!!!!
              /// dalil
              /// 1- chon ma bala baraye provide listener ro false ntekhab kardim pas ba har taghiir dge kol widget taghiir nmikone
              /// 2- chon mikhaim faghat favorite ma taghiir kone az consumer estefad kardim
              /// dar vaghe consumer mitoone faghat yek widget montakhab ro baraye ma motaghayer kone bar hasbe taghiirat data!
              leading: Consumer<Product>(
                  builder: (ctx, product, _) =>
                      IconButton(
                        onPressed: () {
                          product.changeFavoriteState();
                        },
                        icon: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Theme
                              .of(context)
                              .accentColor,
                        ),
                      )),
              trailing: IconButton(
                onPressed: () {
                  cart.addItem(product.id, product.title, product.price);
                },
                icon: Icon(Icons.shopping_cart,
                    color: Theme
                        .of(context)
                        .accentColor),
              ),
              title: Text(
                product.title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
