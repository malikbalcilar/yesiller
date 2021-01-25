import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_page/responsive_page.dart';

import '../src/tab_controller.dart';
import '../widgets/top_buttons.dart';
import 'yesiller_business_page.dart';
import 'yesiller_contact_page.dart';
import 'yesiller_home_page.dart';
import 'yesiller_products_page.dart';

/// Ana Sayfa Tabanı
class YesillerHomePageBase extends StatefulWidget {
  ///
  const YesillerHomePageBase({Key key}) : super(key: key);

  @override
  _YesillerHomePageBaseState createState() => _YesillerHomePageBaseState();
}

class _YesillerHomePageBaseState extends ResponsiveState<YesillerHomePageBase> {
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

  PageController pageController = PageController();
  TabControllerMy tabControllerMy = TabControllerMy();
  int current = 0;

  @override
  Widget buildDesktop(BuildContext context) {
    return buildScaffold(true);
  }

  GlobalKey<ScaffoldState> mobileScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget buildMobile(BuildContext context) {
    return buildScaffold(false);
  }

  Scaffold buildScaffold(bool desktop) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: mobileScaffold,
      endDrawer: desktop
          ? null
          : Drawer(
              child: Container(
                color: const Color(0xFF042a1d),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15, top: 15),
                      child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    const Expanded(child: TopButtons()),
                  ],
                ),
              ),
            ),
      body: buildStack(size, desktop),
    );
  }

  @override
  Widget buildWideMobileOrTablet(BuildContext context) {
    return buildMobile(context);
  }

  @override
  Widget buildWideTabletOrDesktop(BuildContext context) =>
      buildDesktop(context);

  Widget _mobileAppBar() {
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
        Padding(
          padding: const EdgeInsets.only(right: 15, top: 0),
          child: IconButton(
              icon: const Icon(
                Icons.dehaze_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                mobileScaffold.currentState.openEndDrawer();
              }),
        )

        ///  ÜST BUTONLAR
      ],
    );
  }

  Positioned buildAppBar(Size size, bool desktop) {
    return Positioned(
      left: 0,
      top: 0,
      height: 65,
      width: size.width,
      child: current == 1
          ? Container(
              color: Colors.black,
              child: desktop ? _desktopAppBar() : _mobileAppBar(),
            )
          : ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: desktop ? _desktopAppBar() : _mobileAppBar(),
              ),
            ),
    );
  }

  Stack buildStack(Size size, bool dektop) {
    return Stack(
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
        buildAppBar(size, dektop)
      ],
    );
  }

  Widget _desktopAppBar() {
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
}
