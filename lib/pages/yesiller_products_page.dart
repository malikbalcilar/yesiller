import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/ceviz.jpg",
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Ceviz Kömür",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 50,
                            color: Color(0xFF094c06)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Container(
                          color: Color(0xFF192e1b),
                          height: 1.5,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Ebat:",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 33,
                                color: Color(0xFF094c06)),
                          ),
                          Text("22mm-80mm", style: TextStyle(fontSize: 32,)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Kalori:",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 33,
                                color: Color(0xFF094c06)),
                          ),
                          Text("4000kkal/kg-7300kkal/kg", style: TextStyle(fontSize: 32)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Kullanım Alanları:",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 33,
                                color: Color(0xFF094c06)),
                          ),
                          Text("Soba ve kalorifer kazanlarında kullanılmakta ve 25 kg’lık torbalarda satışa sunulmaktadır.", style: TextStyle(fontSize: 32)),
                        ],
                      )

                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
