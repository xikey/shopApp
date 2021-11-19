import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/Products.dart';
import '../widget/product_grid_item_widget.dart';

class ProductsGridWidget extends StatelessWidget {
  const ProductsGridWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///مهم مهم مهم
    ///استفاده از پرووایدر در اینجا به ویجت میفهمونه که با تو حالا شنونده هستی برای تغییرات پروایدر اصلی که جنریک شده
    ///اینجا products جنریک شده
    ///قسمت مهم ماجرا اینجاس که فقط فقط فقط همین ویجت تغییرات روش اعمال میشه و در واقع set state
    ///ویجت های بالاسری هییییچ تغییری نمیکنند و حتی ست استیت(set state) اونها هم فراخوانی نمیشه
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
          mainAxisSpacing: 10),
      itemBuilder: (bContext, index) => Container(
          child: ProductGridItem(
        id: products[index].id,
        key: Key(products[index].id),
        title: products[index].title,
        imageUrl: products[index].imageUrl,
      )),
      padding: const EdgeInsets.all(10.0),
    );
  }
}
