import 'dart:html';

import 'package:flutter/material.dart';
import 'package:yesiller/src/tab_controller.dart';

///
class TopButtons extends StatefulWidget {
  ///
  const TopButtons({Key key}) : super(key: key);

  @override
  _TopButtonsState createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
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

  String _hover;

  bool isHover(String buttonName) {
    _hover ??= "nAn";
    return _hover == buttonName;
  }

  Offset _pos(String button) {
    //add key to your widget, which position you need to find
    RenderBox box = _keys[button].currentContext.findRenderObject();
    return box.localToGlobal(Offset.zero); //this is global position
  }

  bool overlayAdded = false;

  Future<void> _addOverlay() async {
    await Future.delayed(const Duration(milliseconds: 100));
    var pos = _pos("Kurumsal");
    print(pos);

    var overl = OverlayEntry(
        builder: (c) {
          return AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            width: 100,
            height: _hover == "Kurumsal" ? 100 : 20,
            left: pos.dx,
            top: 60,
            child: MouseRegion(
              onExit: (e) {
                setState(() {
                  _hover = "NaN";
                });
              },
              onHover: (e) {
                setState(() {
                  _hover = "Kurumsal";
                });
              },
              child: AnimatedOpacity(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 1000),
                opacity: _hover == "Kurumsal" ? 1 : 0,
                child: Card(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Builder(
                      builder: (c) {
                        return const Text("AAAAA aAAAAa AAAA");
                      },
                    ),
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
        maintainState: false);

    Overlay.of(context).insert(overl);
  }

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      /// Butonların bulunduğu kısmın sağ ve soldan uzaklığı
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Row(
        children: _categories.entries
            .map(
              (e) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: current == 1 ? Colors.transparent : Colors.transparent),
                key: _keys[e.key],
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextButton(
                    onPressed: () {
                      TabControllerMy()
                          .jumpTo(_categories.keys.toList().indexOf(e.key));
                    },
                    child: Text(
                      e.key,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    )),
              ),
            )
            .toList(),
      ),
    );
  }
}
