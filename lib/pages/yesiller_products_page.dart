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
    return KalipArka(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
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
                            fontFamily: "Clean",
                              fontWeight: FontWeight.w900,
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
                        RichText(
                            text: TextSpan(
                                text: "Kullanım Alanları:",
                                style: TextStyle(
                                    fontFamily: "Clean",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 33,
                                    color: Color(0xFF094c06)),
                                children: <TextSpan>[
                              TextSpan(
                                  text:
                                      "Soba ve kalorifer kazanlarında kullanılmakta ve 25 kg’lık torbalarda satışa sunulmaktadır.",
                                  style: TextStyle(fontFamily: "Clean",
                                      fontSize: 32,
                                      fontWeight:FontWeight.w500 ,
                                      color: Colors.black))
                            ])),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: RichText(
                              text: TextSpan(
                                  text: "Kullanım Alanları:",
                                  style: TextStyle(
                                      fontFamily: "Clean",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 33,
                                      color: Color(0xFF094c06)),
                                  children: <TextSpan>[
                                TextSpan(
                                    text:
                                        "Soba ve kalorifer kazanlarında kullanılmakta ve 25 kg’lık torbalarda satışa sunulmaktadır.",
                                    style: TextStyle(
                                      fontFamily: "Clean",
                                        fontSize: 32,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black))
                              ])),
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Kullanım Alanları:",
                                style: TextStyle(
                                    fontFamily: "Clean",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 33,
                                    color: Color(0xFF094c06)),
                                children: <TextSpan>[
                              TextSpan(
                                  text:
                                      "Soba ve kalorifer kazanlarında kullanılmakta ve 25 kg’lık torbalarda satışa sunulmaktadır.",
                                  style: TextStyle(
                                      fontFamily: "Clean",
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black))
                            ]))
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
