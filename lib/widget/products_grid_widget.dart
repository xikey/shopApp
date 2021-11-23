import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/Products.dart';
import '../widget/product_grid_item_widget.dart';

class ProductsGridWidget extends StatelessWidget {
  const ProductsGridWidget({Key? key, required this.showOnlyFavorites,
  }) : super(key: key);

 final bool showOnlyFavorites;

  @override
  Widget build(BuildContext context) {
    ///مهم مهم مهم
    ///استفاده از پرووایدر در اینجا به ویجت میفهمونه که با تو حالا شنونده هستی برای تغییرات پروایدر اصلی که جنریک شده
    ///اینجا products جنریک شده
    ///قسمت مهم ماجرا اینجاس که فقط فقط فقط همین ویجت تغییرات روش اعمال میشه و در واقع set state
    ///ویجت های بالاسری هییییچ تغییری نمیکنند و حتی ست استیت(set state) اونها هم فراخوانی نمیشه
    final productsData = Provider.of<Products>(context);

    final products = !showOnlyFavorites? productsData.items:productsData.showOnlyFavorites;

    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
          mainAxisSpacing: 10),
      itemBuilder: (bContext, index) =>
      ///
      /// important *********************************
      /// chera az ChangeNotifierProvider.create estefade nakardim va az ChangeNotifierProvider.value estefade kardim
      /// 1- hamishe behtare to list ha az value estefade konim chon be context niza nadarom va to listha hengame recycle shodan bug eejad mishe
      /// 2- chon az provider estefade kardim vaghty kare safhe bade ma tamoom mishe data az bein nmire ammmaaaa too halate value az bein mire
          //   ChangeNotifierProvider(
          // create: (cntx)=>products[index],
          ChangeNotifierProvider.value(
        value: products[index],
        child: Container(child: ProductGridItem()),
      ),
      padding: const EdgeInsets.all(10.0),
    );
  }
}
