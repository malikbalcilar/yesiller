import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
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

  final Curve _curve = Curves.easeInOutCubic;


  @override
  void initState() {
//    loadImages();
    Timer.periodic(const Duration(seconds: 10), (timer) async {
      await pageController.animateToPage(current + 1,
          duration: const Duration(milliseconds: 1700),
          curve: _curve);
//      setState(() {
//        if (current == -1) {
//          current = 1;
//        } else {
//          current++;
//        }
//      });
    });
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

//  Map<String, Uint8List> _bytes = {};
//
//  Future<void> loadImages() async {
//    for (var a in yaziler.keys) {
//      var comp = Completer();
//
//      AssetImage("assets/$a")
//          .resolve(ImageConfiguration.empty)
//          .addListener(ImageStreamListener((i, b) async {
//        var c = await i.image.toByteData();
//
//        comp.complete(c.buffer.asUint8List());
//      }));
//      _bytes[a] = await comp.future;
//      setState(() {
//
//      });
//    }
//
//    return;
//  }

  PageController pageController = PageController();
  int current = 0;

  Widget gecisli({@required Size size}) {
    return Container(
        width: size.width,
        height: size.height,
        child: PageView.builder(
          onPageChanged: (i) {
            setState(() {
              current = i;
            });
          },
          controller: pageController,
          itemBuilder: (c, i) {
            var e = yaziler.entries.toList()[i % yaziler.length];
            return Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/${e.key}"),
                            fit: BoxFit.cover)),
                    height: 600,
                    alignment: const Alignment(-0.8986516466, 0),
                    width: size.width),
                AnimatedPositioned(
                  curve: _curve,
                  child: AnimatedOpacity(
                    curve: _curve,
                    duration: const Duration(milliseconds: 1500),
                    opacity: current == i ? 1 : 0,
                    child: Text(
                      e.value,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                  duration: const Duration(milliseconds: 1500),
                  top: (size.height / 2),
                  right: current == i ? 30 : 120,
                )
              ],
            );
          },
        ));
  }

  Map<String, String> yaziler = {
    "kömür.jpg": "Burda Kömür Var",
    "kömürel.jpg": "Kömürlü Adam Bu Aq",
    "orman.jpg": "Ağaç Dikmeden Yağmur \nDuasına Çıkılmaz",
    "odun.jpg": "Odun Kırmayı Iyı Biliriz"
  };

  _precachePicture(BuildContext context) {
    yaziler.keys.forEach((element) {
      precacheImage(AssetImage("assets/$element"), context);
    });
  }

  @override
  Widget buildDesktop(BuildContext context) {
    _precachePicture(context);
//    if (_bytes.length != yaziler.length) {
//      return const Center(
//        child: CircularProgressIndicator(),
//      );
//    }

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              gecisli(
                size: Size(size.width, 600),
              ),
              Positioned(
                left: 0,
                top: 0,
                height: 60,
                width: size.width,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 300,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.white.withOpacity(0.6),
                                Colors.transparent
                              ],
                                  stops: const [
                                0.3,
                                1
                              ],
                                  begin: Alignment.centerLeft,
                                  end: const Alignment(1, 0))),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            height: 60,
                            width: 120,
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/logoyeni.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
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
