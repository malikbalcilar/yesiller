import 'dart:html';

import 'package:flutter/material.dart';
import 'package:responsive_page/responsive_page.dart';
import 'package:yesiller/src/tab_controller.dart';

///
class TopButtons extends StatefulWidget {
  ///
  const TopButtons({Key key, this.color = Colors.black}) : super(key: key);

  final Color color;

  @override
  _TopButtonsState createState() => _TopButtonsState();
}

class _TopButtonsState extends ResponsiveState<TopButtons> {
  final Map<String, String> _categories = {
    "Anasayfa": "/",
    "Ürünler": "/product",
    "Kurumsal": "/business",
    "İletişim": "/contact"
  };

  final Map<String, GlobalKey> _keys = {
    "Anasayfa": GlobalKey(),
    "Ürünler": GlobalKey(),
    "Kurumsal": GlobalKey(),
    "İletişim": GlobalKey()
  };

  int current;

  TabControllerMy tabControllerMy = TabControllerMy();

  @override
  void initState() {
    current = tabControllerMy.currentPage;
    tabControllerMy.addListener(() {
      setState(() {
        current = tabControllerMy.currentPage;
      });
    });
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     /// Butonların bulunduğu kısmın sağ ve soldan uzaklığı
  //     padding: const EdgeInsets.symmetric(horizontal: 45),
  //     child: Row(
  //       children: buildChildren(),
  //     ),
  //   );
  // }

  @override
  Widget buildDesktop(BuildContext context) {
    return Padding(
      /// Butonların bulunduğu kısmın sağ ve soldan uzaklığı
      padding: const EdgeInsets.only(right: 40),
      child: Row(
        children: buildChildren(
            const EdgeInsets.symmetric(horizontal: 12, vertical: 5)),
      ),
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    var children = buildChildren(
        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        navigate: true);

    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(_categories.length * 2, (index) {
          if (index.isEven) {
            return children[(index / 2).floor()];
          } else {
            return Container(
              height: 0.5,
              color: Colors.white.withOpacity(0.5),
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 0),
            );
          }
        }),
      ),
    );
  }

  @override
  Widget buildWideMobileOrTablet(BuildContext context) {
    return buildMobile(context);
  }

  @override
  Widget buildWideTabletOrDesktop(BuildContext context) {
    return buildDesktop(context);
  }

  ///
  List<Widget> buildChildren(EdgeInsets padding, {bool navigate = false}) {
    return _categories.entries
        .map(
          (e) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: current == 1 ? Colors.transparent : Colors.transparent),
            key: _keys[e.key],
            padding: padding,
            child: InkWell(
                onTap: () {
                  if (navigate) {
                    Navigator.pop(context);
                  }
                  TabControllerMy()
                      .jumpTo(_categories.keys.toList().indexOf(e.key));
                },
                child: Container(
                  width: navigate?  double.infinity: null,
                  alignment: Alignment.center,
                  child: Text(
                    e.key,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                )),
          ),
        )
        .toList();
  }
}
