import 'package:flutter/material.dart';
import 'package:yesiller/pages/yesiller_home_page_base.dart';

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

  /// OK  ///appbar ayarlanacak
  /// OK   ///facebook,instagram iconlarına tıklanınca sayfalara gidecek
  /// OK  ///facebook : https://www.facebook.com/yesillergroup/
  /// OK  ///instagram : https://www.instagram.com/yesillerkomur/?hl=tr
  /// OK ///telefonlara basınca her numara için farklı arama yapılsın
  /// OK ///ürünler kısımları dinamik yapılacak
  /// OK  ///kurumsal butonu ayarlanacak
  ///iletişim formu gönder butonu bağlanacak mail adresi : satisyesiller@gmail.com
  ///MEMEEEEEEEEET T T T T T T T T T T T T T T T T T T T T

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Clean",
      ),
      title: "Yeşiller",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (s) {
/*        "Anasayfa": "/",
        "Ürünler": "/product",
        "Kurumsal": "/business",
        "İletişim": "/contact"*/

        var name = s.name;
        switch (name) {
          case "/product":
            return MaterialPageRoute(builder: (c) {
              return const YesillerProductsPage();
            });
            break;

          case "/business":
            return MaterialPageRoute(builder: (c) {
              return const YesillerBusinessPage();
            });
            break;
          case "/contact":
            return MaterialPageRoute(builder: (c) {
              return const YesillerContactPage();
            });
            break;

          case "/":
            return MaterialPageRoute(builder: (c) {
              return const YesillerHomePageBase();
            });
            break;
          default:
            return MaterialPageRoute(builder: (c) {
              return const YesillerHomePageBase();
            });
            break;
        }
      },
    );
  }
}
