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
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Row(
        children: buildChildren(
            const EdgeInsets.symmetric(horizontal: 15, vertical: 5)),
      ),
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    return Padding(
      /// Butonların bulunduğu kısmın sağ ve soldan uzaklığı
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: buildChildren(
              const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              navigate: true),
        ),
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
            child: TextButton(
                onPressed: () {
                  if (navigate) {
                    Navigator.pop(context);
                  }
                  TabControllerMy()
                      .jumpTo(_categories.keys.toList().indexOf(e.key));
                },
                child: Text(
                  e.key,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                )),
          ),
        )
        .toList();
  }
}
