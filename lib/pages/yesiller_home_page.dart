import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_page/responsive_page.dart';
import 'package:yesiller/src/addresses.dart';
import 'package:yesiller/widgets/kaliparka.dart';
import '../widgets/address_widget.dart';
import '../widgets/top_buttons.dart';

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
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      await pageController.animateToPage(current + 1,
          duration: const Duration(milliseconds: 1700), curve: _curve);
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

  ///
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
                    height: size.height,
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

  void _precachePicture(BuildContext context) {
    // ignore: avoid_function_literals_in_foreach_calls
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
    return KalipArka(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                gecisli(
                  size: Size(size.width, 650),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  height: 65,
                  width: size.width,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 65,
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
                              margin: const EdgeInsets.only(left: 15),
                              alignment: Alignment.centerLeft,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              height: 65,
                              width: 120,
                              child: Image.asset(
                                "assets/logoyeni.png",
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),

                          /// Üst Butonlar Buraya Taşındı
                          const TopButtons()

                          ///  ÜST BUTONLAR
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.symmetric(horizontal: 45),
                          //   child: Row(
                          //     mainAxisAlignment:
                          //         MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       FlatButton(
                          //           onPressed: () {},
                          //           child: Text(
                          //             "Anasayfa",
                          //             style: TextStyle(
                          //                 color: Colors.white, fontSize: 14),
                          //           )),
                          //       FlatButton(
                          //           onPressed: () {},
                          //           child: Text(
                          //             "Ürünler",
                          //             style: TextStyle(
                          //                 color: Colors.white, fontSize: 14),
                          //           )),
                          //       FlatButton(
                          //           onPressed: () {},
                          //           child: Text(
                          //             "Kurumsal",
                          //             style: TextStyle(
                          //                 color: Colors.white, fontSize: 14),
                          //           )),
                          //       FlatButton(
                          //           onPressed: () {},
                          //           child: Text(
                          //             "İletişim",
                          //             style: TextStyle(
                          //                 color: Colors.white, fontSize: 14),
                          //           )),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: size.width,
              height: 300,

              ///ALT TARAF ADRESLER
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 3,
                      child:  AddressWidget(
                        addressList: address1,
                      ),
                    ),
//                    const SizedBox(
//                      width: 60,
//                    ),
                    Expanded(
                      flex: 3,
                      child:  AddressWidget(
                        addressList: address2,
                      ),
                    ),
//                    const SizedBox(
//                      width: 400,
//                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(11)),
                                child: Image.asset(
                                  "icons8-instagram.gif",
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Image.asset("facebook.gif",
                                      height: 40, width: 40)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 1,
                            width: 125,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    color: Colors.greenAccent,
                                    offset: Offset(1, 2))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          const Text(
                            "TAKİPTE KALIN",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
