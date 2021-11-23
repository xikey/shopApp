import 'package:flutter/material.dart';
import 'package:shopp_app/providers/cart.dart';
import 'package:shopp_app/view/cart_screen.dart';
import 'package:shopp_app/view/product_datil_screen.dart';

import 'view/product_overview_screen.dart';
import './providers/Products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// کل صفحه اصلی رو گذاشتیم تو پرووایدر لیسنر. پس تغییری اگه اعمال بشه این صفحه مججدا ست ساتیت میشه !!؟؟؟؟؟!!؟؟
    /// خیررررر
    /// فقط ویجت هایی مجددا ساخته میشن که لیسنر(listener) باااااشن
    /// چون تعداد پرووایدر ما زیاد شد مولتی پروواایدر استفاده کردیم...
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (cntx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (cntx) => Cart(),
        )
      ],
      child: MaterialApp(
        title: 'Zikey Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Lato',
            primarySwatch: Colors.red,
            accentColor: Colors.amberAccent),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routName: (cntx) => ProductDetailScreen(),
          CartScreen.routName: (cntx) => CartScreen()
        },
      ),
    );
  }
}
