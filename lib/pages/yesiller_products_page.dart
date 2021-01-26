import 'package:flutter/material.dart';
import 'package:responsive_page/responsive_page.dart';
import '../src/products.dart';
import '../widgets/kaliparka.dart';

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
          child: Padding(
            padding: const EdgeInsets.only(left: 30 , right: 30 , top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: products
                  .map((product) => Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: product["i"].isEven
                              ? childrenRow(
                                  product, fontSize1, fontSize2, fontSize3)
                              : childrenRow(
                                      product, fontSize1, fontSize2, fontSize3,
                                      rev: true)
                                  .reversed
                                  .toList(),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> childrenRow(Map<String, dynamic> product, double fontSize1,
      double fontSize2, double fontSize3,
      {bool rev = false}) {
    return [
      Expanded(
        child: Container(child: buildProductPicture(product)),
      ),
      Expanded(
        child: Container(
          alignment: rev ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            alignment: Alignment.centerRight,
            child: buildProductDescription(
              product,
              fontSize1,
              fontSize2,
              fontSize3,
            ),
          ),
        ),
      ),
    ];
  }

  Column buildProductDescription(Map<String, dynamic> product, double fontSize1,
      double fontSize2, double fontSize3,
      {bool rev = false}) {
    return Column(
      crossAxisAlignment:
          rev ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          product["title"],
          style: TextStyle(
              fontFamily: "Clean",
              fontWeight: FontWeight.w900,
              fontSize: fontSize1,
              color: const Color(0xFF094c06)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Container(
            color: const Color(0xFF192e1b),
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
                        color: const Color(0xFF094c06)),
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
    return buildKalipArka(29, 22, 20);
  }

  @override
  Widget buildWideMobileOrTablet(BuildContext context) {
    return buildKalipArka(45, 28, 25);
  }

  @override
  Widget buildWideTabletOrDesktop(BuildContext context) {
    return buildKalipArka(48, 30, 28);
  }
}
