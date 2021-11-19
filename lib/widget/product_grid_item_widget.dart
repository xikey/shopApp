import 'package:flutter/material.dart';
import 'package:shopp_app/view/product_datil_screen.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem(
      {Key? key, required this.id, required this.title, required this.imageUrl})
      : super(key: key);

  final String id;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetailScreen.routName,arguments: id);
        },
        splashColor: Colors.blue.withAlpha(30),
        child: GridTile(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.network(
              imageUrl,
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
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Theme.of(context).accentColor,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart,
                    color: Theme.of(context).accentColor),
              ),
              title: Text(
                title,
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
