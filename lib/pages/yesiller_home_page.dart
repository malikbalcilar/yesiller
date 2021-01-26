import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_page/responsive_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yesiller/src/addresses.dart';
import 'package:yesiller/src/tab_controller.dart';
import 'package:yesiller/widgets/kaliparka.dart';
import '../widgets/address_widget.dart';
import '../widgets/top_buttons.dart';

/// Ana Sayfa
class YesillerHomePage extends StatefulWidget {
  ///
  const YesillerHomePage({Key key, this.tabControllerMy}) : super(key: key);

  ///
  final TabControllerMy tabControllerMy;

  @override
  _YesillerHomePageState createState() => _YesillerHomePageState();
}

class _YesillerHomePageState extends ResponsiveState<YesillerHomePage> {
  final Curve _curve = Curves.easeInOutCubic;

  @override
  void initState() {
//    loadImages();
    Timer.periodic(const Duration(seconds: 6), (timer) async {
      if (widget.tabControllerMy.currentPage == 0 &&
          pageController.hasClients) {
        await pageController.animateToPage(current + 1,
            duration: const Duration(milliseconds: 1850), curve: _curve);
      }
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

  PageController pageController = PageController();
  int current = 0;

  ///
  Widget gecisli({@required Size size, double fontSize = 35}) {
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
                    duration: const Duration(milliseconds: 1900),
                    opacity: current == i ? 1 : 0,
                    child: Text(
                      e.value,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                  duration: const Duration(milliseconds: 1500),
                  top: (size.height / 2) - fontSize,
                  right: current == i ? 30 : 120,
                )
              ],
            );
          },
        ));
  }

  Map<String, String> yaziler = {
    "kömür.jpg": "Yüksek Kalori Verimli Enerji",
    "kömürel.jpg": "Isınmanın Değerli Hali",
    "orman.jpg": "Sürdürülebilir Yaşam\nYaşanılabilir Çevre",
    "odun.jpg": "Çevre Dostu Kömür"
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
    var size = MediaQuery.of(context).size;
    return KalipArka(
      child: SingleChildScrollView(
        child: Column(
          children: [
            gecisli(
              size: Size(size.width, 630),
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
                      flex: 35,
                      child: buildAddress1(),
                    ),
                    Expanded(
                      flex: 35,
                      child: buildAddress2(),
                    ),
                    Expanded(
                      flex: 40,
                      child: buildSocialButtons(),
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

  AddressWidget buildAddress2() {
    return AddressWidget(
      addressList: address2,
    );
  }

  AddressWidget buildAddress1() {
    return AddressWidget(
      addressList: address1,
    );
  }

  Column buildSocialButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkResponse(
              onTap: () async {
                if (await canLaunch(
                    "https://www.instagram.com/yesillerkomur/?hl=tr")) {
                  launch("https://www.instagram.com/yesillerkomur/?hl=tr");
                }
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(11)),
                child: Image.asset(
                  "icons8-instagram.gif",
                  height: 40,
                  width: 40,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () async {
                if (await canLaunch(
                    "https://www.facebook.com/yesillergroup/")) {
                  launch("https://www.facebook.com/yesillergroup/");
                }
              },
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.asset("facebook.gif", height: 40, width: 40)),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 1,
          width: 125,
          decoration: const BoxDecoration(
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
        const SizedBox(
          height: 25,
        ),
        const Text(
          "TAKİPTE KALIN",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return KalipArka(
      child: SingleChildScrollView(
        child: Column(
          children: [
            gecisli(
              size: Size(size.width, size.height * 0.6),
              fontSize: 20
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildAddress1(),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 0.3,
                    width: size.width,
                    color: Colors.white.withOpacity(0.5),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  buildAddress2(),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 0.3,
                    width: size.width,
                    color: Colors.white.withOpacity(0.5),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: buildSocialButtons()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildWideMobileOrTablet(BuildContext context) {
    return buildMobile(context);
  }

  @override
  Widget buildWideTabletOrDesktop(BuildContext context) =>
      buildDesktop(context);
}
