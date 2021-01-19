import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_page/responsive_page.dart';

/// Ana Sayfa
class YesillerHomePage extends StatefulWidget {
  ///
  const YesillerHomePage({Key key}) : super(key: key);

  @override
  _YesillerHomePageState createState() => _YesillerHomePageState();
}

class _YesillerHomePageState extends ResponsiveState<YesillerHomePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget ticAddress() {
    return Container(
      child: Text("Ticaret Adres"),
    );
  }

  Widget lojAddress(Color color) {
    return Container(
      child: Text(
        "Lojistik Adres",
        style: TextStyle(color: color),
      ),
    );
  }

  Widget _scaffold(Widget body) {
    return Scaffold(
      body: body,
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/odun.jpg"), fit: BoxFit.cover)),
              height: 600,
              width: size.width),
          Positioned(
            left: 0,
            top: 0,
            height: 60,
            width: size.width,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  child: Row(
                    children: [
                      Container(

                        height: 60,
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/logoyeni.png"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    return _scaffold(Container(
      child: Column(
        children: [ticAddress(), lojAddress(Colors.white)],
      ),
    ));
  }

  @override
  Widget buildWideMobileOrTablet(BuildContext context) {
    return _scaffold(Container(
      child: Column(
        children: [ticAddress(), lojAddress(Colors.white)],
      ),
    ));
  }

  @override
  Widget buildWideTabletOrDesktop(BuildContext context) =>
      buildWideMobileOrTablet(context);
}
