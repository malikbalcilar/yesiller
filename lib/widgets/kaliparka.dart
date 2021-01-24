import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
class KalipArka extends StatefulWidget {
  final Widget child;
  final double distance;
  final Duration duration;
  final bool initialAnimate;
  final Duration opacityDuration;
  final Duration delay;

  ///
  const KalipArka(
      {Key key,
      this.child,
      this.initialAnimate = true,
      this.distance = 40,
      this.duration = const Duration(milliseconds: 1630),
      this.opacityDuration = const Duration(milliseconds: 3000),
      this.delay = const Duration(milliseconds: 150)})
      : super(key: key);

  @override
  _KalipArkaState createState() => _KalipArkaState();
}

class _KalipArkaState extends State<KalipArka> {
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

  @override
  Widget build(BuildContext context) {
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
                                image: AssetImage("logoyeni.png"))),
                      ),
                    ),
                    imageFilter: ImageFilter.blur(sigmaY: 3, sigmaX: 3)),
                AnimatedPositioned(
                  left: animated ? 0 : widget.distance,
                  bottom: 0,
                  right: animated ? 0 : widget.distance * -1,
                  top: 0,
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
          Container(
            width: size.width,
            height: 60,
            alignment: Alignment.centerRight,
            color: const Color(0xFF012418),
            child: Container(
              color: Colors.black.withOpacity(0.8),
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.centerRight,
              child: Container(
                height: 60,
                width: 280,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.transparent
                ], stops: const [
                  0.53,
                  1
                ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
                child: Container(
                  margin: const EdgeInsets.only(right: 15),
                  alignment: Alignment.centerRight,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  height: 60,
                  width: 120,
                  child: Image.asset(
                    "assets/logoyeni.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF012418),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.topLeft,
              children: [
                Positioned(
                  child: Opacity(
                    opacity: 0.055,
                    child: Image.asset(
                      "logoyeni.png",
                      repeat: ImageRepeat.repeat,
                    ),
                  ),
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                ),
                AnimatedPositioned(
                  left: animated ? 0 : widget.distance,
                  bottom: 0,
                  right: animated ? 0 : widget.distance * -1,
                  top: 0,
                  duration: widget.duration,
                  curve: Curves.easeInOutCubic,
                  child: AnimatedOpacity(
                      opacity: animated ? 1 : 0,
                      duration: widget.opacityDuration,
                      curve: Curves.easeInOutCubic,
                      child: widget.child),
                ),
                Positioned(
                  child: BackdropFilter(
                      child: Container(
                        width: size.width,
                        height: size.height,
                      ),
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3)),
                  left: 0,
                  height: 0,
                  top: 0,
                  width: 0,
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: 60,
            alignment: Alignment.centerRight,
            color: const Color(0xFF012418),
            child: Container(
              color: Colors.black.withOpacity(0.8),
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.centerRight,
              child: Container(
                height: 60,
                width: 280,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.transparent
                ], stops: const [
                  0.53,
                  1
                ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
                child: Container(
                  margin: const EdgeInsets.only(right: 15),
                  alignment: Alignment.centerRight,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  height: 60,
                  width: 120,
                  child: Image.asset(
                    "assets/logoyeni.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

///
/// Burada birşey
/// Gitte son
