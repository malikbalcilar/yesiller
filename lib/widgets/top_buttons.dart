import 'dart:html';

import 'package:flutter/material.dart';

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

  _addOverlay() async {
    await Future.delayed(const Duration(milliseconds: 100));
    var pos = _pos("Kurumsal");
    var _buttonW = 80.0;
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
              onExit: (e){
                setState(() {
                  _hover = "NaN";
                });
              },
              onHover: (e){
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
                        return Text("AAAAA aAAAAa AAAA");
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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _addOverlay();
    return Padding(
      /// Butonların bulunduğu kısmın sağ ve soldan uzaklığı
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Row(
        children: _categories.entries
            .map(
              (e) => Padding(
                key: _keys[e.key],
                padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 5),
                child: MouseRegion(
                  onEnter: (po) {
                    print(po.position);
                    setState(() {
                      _hover = e.key;
                    });
                  },
                  onExit: (ee) {
                    print("exit");
                    // Navigator.pop(context);

                    setState(() {
                      _hover = "nAn";
                    });
                  },
                  onHover: (po) {
                    // print(po.position);
                    // setState(() {
                    //   _hover = e.key;
                    // });
                  },
                  child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, e.value);
                      },
                      child: Text(
                        e.key,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      )),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
