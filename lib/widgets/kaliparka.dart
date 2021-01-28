import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_page/responsive_page.dart';
import 'package:yesiller/src/tab_controller.dart';

///
class KalipArka extends StatefulWidget {
  ///
  const KalipArka(
      {Key key,
      this.child,
      this.initialAnimate = true,
      this.distance = 40,
      this.duration = const Duration(milliseconds: 1630),
      this.opacityDuration = const Duration(milliseconds: 3000),
      this.delay = const Duration(milliseconds: 150),
      this.yatay = true})
      : super(key: key);
  final Widget child;
  final double distance;
  final Duration duration;
  final bool initialAnimate;
  final Duration opacityDuration;
  final Duration delay;
  final bool yatay;

  @override
  _KalipArkaState createState() => _KalipArkaState();
}

class _KalipArkaState extends ResponsiveState<KalipArka> {

  @override
  void initState() {


    animated = !widget.initialAnimate;
    animate();
    super.initState();
  }

  bool animated;

  Future<void> animate() async {
    await Future.delayed(widget.delay);
    setState(() {
      animated = (true);
    });
  }


  Widget buildAll(BuildContext context , double bottomH ) {
    var size = MediaQuery.of(context).size;

    return Container(
      color: const Color(0xFF012418),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                ImageFiltered(
                    child: Opacity(
                      opacity: 0.055,
                      child: Container(
                        width: size.width,
                        height: size.height,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                repeat: ImageRepeat.repeat,
                                image: AssetImage("assets/logoyeni.png"))),
                      ),
                    ),
                    imageFilter: ImageFilter.blur(sigmaY: 3, sigmaX: 3)),
                AnimatedPositioned(
                  left: !widget.yatay
                      ? 0
                      : animated
                          ? 0
                          : widget.distance,
                  bottom: widget.yatay
                      ? 0
                      : animated
                          ? 0
                          : widget.distance * -1,
                  right: !widget.yatay
                      ? 0
                      : animated
                          ? 0
                          : widget.distance * -1,
                  top: widget.yatay
                      ? 0
                      : animated
                          ? 0
                          : widget.distance,
                  duration: widget.duration,
                  curve: Curves.easeInOutCubic,
                  child: AnimatedOpacity(
                      opacity: animated ? 1 : 0,
                      duration: widget.opacityDuration,
                      curve: Curves.easeInOutCubic,
                      child: widget.child),
                ),
              ],
            ),
          ),

          /// Bottom siyah bar
          SafeArea(
            child: Container(
              width: size.width,
              height: bottomH,
              alignment: Alignment.centerRight,
              color: const Color(0xFF012418),
              child: Container(
                color: Colors.black.withOpacity(0.8),
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.centerRight,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 0,
                      height: bottomH,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "COPYRIGHT ${String.fromCharCode(0x00A9)} 2021 MM Yazılım",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 11),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        height: bottomH,
                        width: 280,
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              Colors.white.withOpacity(0.5),
                              Colors.transparent
                            ],
                                stops: const [
                              0.53,
                              1
                            ],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft)),
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          alignment: Alignment.centerRight,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          height: bottomH,
                          width: 120,
                          child: Image.asset(
                            "assets/logoyeni.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  @override
  Widget buildDesktop(BuildContext context) {
    return buildAll(context, 60);
  }

  @override
  Widget buildMobile(BuildContext context) {
    // TODO: implement buildMobile
    return buildAll(context, 40);

  }

  @override
  Widget buildWideMobileOrTablet(BuildContext context) {
    // TODO: implement buildWideMobileOrTablet
    return buildAll(context, 50);

  }

  @override
  Widget buildWideTabletOrDesktop(BuildContext context) {
    // TODO: implement buildWideTabletOrDesktop
    return buildAll(context, 50);

  }
}

///
/// Burada birşey
/// Gitte son
