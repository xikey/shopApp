import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/providers/cart.dart';
import 'package:shopp_app/widget/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routName = '/my_cart';

  @override
  Widget build(BuildContext context) {
    final myCart = Provider.of<Cart>(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                  ),
                  Chip(
                    backgroundColor: Theme.of(context).accentColor,
                    label: Text('\$${myCart.totalPrice}'),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (cntx, position) => CartItemWidget(
                productId: myCart.items.keys.toList()[position],
                id: myCart.items.values.toList()[position].id,
                price: myCart.items.values.toList()[position].price,
                quantity: myCart.items.values.toList()[position].quantity,
                title: myCart.items.values.toList()[position].title),
            itemCount: myCart.itemCounts,
          ))
        ],
      ),
    ));
  }
}
