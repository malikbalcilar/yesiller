import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_page/responsive_page.dart';
import 'package:yesiller/pages/yesiller_business_page.dart';
import 'package:yesiller/pages/yesiller_contact_page.dart';
import 'package:yesiller/pages/yesiller_home_page.dart';
import 'package:yesiller/pages/yesiller_products_page.dart';
import 'package:yesiller/src/addresses.dart';
import 'package:yesiller/src/tab_controller.dart';
import 'package:yesiller/widgets/kaliparka.dart';
import '../widgets/address_widget.dart';
import '../widgets/top_buttons.dart';

/// Ana Sayfa Tabanı
class YesillerHomePageBase extends StatefulWidget {
  ///
  const YesillerHomePageBase({Key key}) : super(key: key);

  @override
  _YesillerHomePageBaseState createState() => _YesillerHomePageBaseState();
}

class _YesillerHomePageBaseState extends ResponsiveState<YesillerHomePageBase> {
  final Curve _curve = Curves.easeInOutCubic;

  @override
  void initState() {
    current = tabControllerMy.currentPage;

    tabControllerMy
      ..attach(pageController)
      ..addListener(() {
        setState(() {
          current = tabControllerMy.currentPage;
        });
      });

    super.initState();
  }

  Widget ticAddress() {
    return const Text("Ticaret Adres");
  }

  Widget lojAddress(Color color) {
    return Text(
      "Lojistik Adres",
      style: TextStyle(color: color),
    );
  }

  Widget _scaffold(Widget body) {
    return Scaffold(
      body: body,
    );
  }

  PageController pageController = PageController();
  TabControllerMy tabControllerMy = TabControllerMy();
  int current = 0;

  Widget _row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 65,
          width: 300,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white.withOpacity(0.6), Colors.transparent],
                  stops: const [0.3, 1],
                  begin: Alignment.centerLeft,
                  end: const Alignment(1, 0))),
          child: Container(
            margin: const EdgeInsets.only(left: 10),

            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            height: 65,
            width: 145,
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Image.asset(
                "assets/logoyeni.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),

        /// Üst Butonlar Buraya Taşındı
        const TopButtons()

        ///  ÜST BUTONLAR
      ],
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              YesillerHomePage(
                tabControllerMy: tabControllerMy,
              ),
              const YesillerProductsPage(),
              const YesillerBusinessPage(),
              const YesillerContactPage(),
            ],
          ),

          /// AppBar
          Positioned(
            left: 0,
            top: 0,
            height: 65,
            width: size.width,
            child: current == 1
                ? Container(color: Colors.black,child: _row(),) /*Container(
                    width: size.width,
                    height: 60,
                    alignment: Alignment.centerLeft,
                    color: const Color(0xFF012418),
                    child: Container(
                      color: Colors.black.withOpacity(0.8),
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: _row(),
                    ),
                  )*/
                : ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: _row(),
                    ),
                  ),
          )
        ],
      ),
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildDesktop(context);
  }

  @override
  Widget buildWideMobileOrTablet(BuildContext context) {
    return _scaffold(Column(
      children: [ticAddress(), lojAddress(Colors.white)],
    ));
  }

  @override
  Widget buildWideTabletOrDesktop(BuildContext context) =>
      buildWideMobileOrTablet(context);
}
