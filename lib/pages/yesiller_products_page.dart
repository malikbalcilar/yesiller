import 'package:flutter/material.dart';
import 'package:yesiller/src/products.dart';
import 'package:yesiller/src/tab_controller.dart';
import 'package:yesiller/widgets/kaliparka.dart';

///
class YesillerProductsPage extends StatefulWidget {
  ///
  const YesillerProductsPage({Key key}) : super(key: key);

  @override
  _YesillerProductsPageState createState() => _YesillerProductsPageState();
}

class _YesillerProductsPageState extends State<YesillerProductsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KalipArka(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: products
                .map((product) => Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              product["asset"],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  product["title"],
                                  style: TextStyle(
                                      fontFamily: "Clean",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 50,
                                      color: Color(0xFF094c06)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 40),
                                  child: Container(
                                    color: Color(0xFF192e1b),
                                    height: 1.5,
                                  ),
                                ),
                                for (var _prop in product["properties"].entries)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: RichText(
                                        text: TextSpan(
                                            text: "${_prop.key}:",
                                            style: TextStyle(
                                                fontFamily: "Clean",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 33,
                                                color: Color(0xFF094c06)),
                                            children: <TextSpan>[
                                          TextSpan(
                                              text: _prop.value,
                                              style: TextStyle(
                                                  fontFamily: "Clean",
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black))
                                        ])),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
