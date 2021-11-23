import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget(
      {Key? key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.productId})
      : super(key: key);
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).deleteItem(productId);
      },
      key: UniqueKey(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 25),
        color: Theme.of(context).errorColor,
        child: const Icon(
          Icons.delete_forever_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsetsDirectional.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                  child: Text(
                '\$$price',
                style: TextStyle(fontSize: 10),
              )),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${quantity * price}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
