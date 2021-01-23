import 'package:flutter/material.dart';

import 'pages/yesiller_business_page.dart';
import 'pages/yesiller_contact_page.dart';
import 'pages/yesiller_home_page.dart';
import 'pages/yesiller_products_page.dart';

void main() {
  runApp(const YesillerWebSite());
}

/// Material Application
class YesillerWebSite extends StatelessWidget {
  ///
  const YesillerWebSite({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Clean",
      ),
      title: "Yeşiller",
      debugShowCheckedModeBanner: false,
      home: const YesillerHomePage(),
      onGenerateRoute: (s) {


/*        "Anasayfa": "/",
        "Ürünler": "/product",
        "Kurumsal": "/business",
        "İletişim": "/contact"*/


        var name = s.name;
        switch (name) {

          case "/product" :
            return MaterialPageRoute(builder: (c) {
              return const YesillerProductsPage();
            });
            break;

          case "/business" :
            return MaterialPageRoute(builder: (c) {
              return const YesillerBusinessPage();
            });
            break;
          case "/contact" :
            return MaterialPageRoute(builder: (c) {
              return const YesillerContactPage();
            });
            break;


          case "/":
            return MaterialPageRoute(builder: (c) {
              return const YesillerHomePage();
            });
            break;
          default:
            return MaterialPageRoute(builder: (c) {
              return const YesillerHomePage();
            });
            break;
        }
      },
    );
  }
}
