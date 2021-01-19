import 'package:flutter/material.dart';
import 'pages/yesiller_home_page.dart';


void main() {
  runApp(const YesillerWebSite());
}





/// Material Application
class YesillerWebSite extends StatelessWidget {
  ///
  const YesillerWebSite({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Clean"),
      title: "Yeşiller",
      debugShowCheckedModeBanner: false,
      home: const YesillerHomePage(),
    );
  }
}
