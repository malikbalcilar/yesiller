import 'package:flutter/material.dart';

///
class YesillerBusinessPage extends StatefulWidget {

  ///
  const YesillerBusinessPage({Key key}) : super(key: key);

  @override
  _YesillerBusinessPageState createState() => _YesillerBusinessPageState();
}

class _YesillerBusinessPageState extends State<YesillerBusinessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Kurumsal"),
      ),
    );
  }
}