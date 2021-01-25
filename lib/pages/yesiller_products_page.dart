import 'package:flutter/material.dart';
import 'package:responsive_page/responsive_page.dart';
import 'package:yesiller/src/products.dart';
import 'package:yesiller/src/tab_controller.dart';
import 'package:yesiller/widgets/kaliparka.dart';

///
class YesillerProductsPage extends StatefulWidget {
  ///
  const YesillerProductsPage({Key key}) : super(key: key);

  @override
  _YesillerProductsPageState createState() => _YesillerProductsPageState();
}

class _YesillerProductsPageState extends ResponsiveState<YesillerProductsPage> {
  @override
  void initState() {
    super.initState();
  }

  KalipArka buildKalipArka(
      double fontSize1, double fontSize2, double fontSize3) {
    return KalipArka(
      yatay: false,
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: products
                .map((product) => Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: buildProductPicture(product),
                            ),
                            Expanded(
                              child: buildProductDescription(
                                  product, fontSize1, fontSize2, fontSize3),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  Column buildProductDescription(Map<String, dynamic> product, double fontSize1,
      double fontSize2, double fontSize3) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product["title"],
          style: TextStyle(
              fontFamily: "Clean",
              fontWeight: FontWeight.w900,
              fontSize: fontSize1,
              color: Color(0xFF094c06)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Container(
            color: Color(0xFF192e1b),
            height: 1.5,
          ),
        ),
        for (var _prop in product["properties"].entries)
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: RichText(
                text: TextSpan(
                    text: "${_prop.key}:",
                    style: TextStyle(
                        fontFamily: "Clean",
                        fontWeight: FontWeight.w700,
                        fontSize: fontSize2,
                        color: Color(0xFF094c06)),
                    children: <TextSpan>[
                  TextSpan(
                      text: _prop.value,
                      style: TextStyle(
                          fontFamily: "Clean",
                          fontSize: fontSize3,
                          fontWeight: FontWeight.w500,
                          color: Colors.black))
                ])),
          ),
      ],
    );
  }

  Container buildProductPicture(Map<String, dynamic> product) {
    return Container(
      height: 500,
      width: 500,
      child: Image.asset(
        product["asset"],
      ),
    );
  }

  @override
  Widget buildDesktop(Object context) {
    return buildKalipArka(50, 33, 32);
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildKalipArka(40, 25, 23);
  }

  @override
  Widget buildWideMobileOrTablet(BuildContext context) {
    return buildKalipArka(40, 25, 23);
  }

  @override
  Widget buildWideTabletOrDesktop(BuildContext context) {
    return buildKalipArka(50, 33, 32);
  }
}
