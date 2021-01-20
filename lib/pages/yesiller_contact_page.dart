import 'dart:html';

import 'package:flutter/material.dart';

///
class YesillerContactPage extends StatefulWidget {
  ///
  const YesillerContactPage({Key key}) : super(key: key);

  @override
  _YesillerContactPageState createState() => _YesillerContactPageState();
}

class _YesillerContactPageState extends State<YesillerContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("İletişim"),
      ),
    );
  }
}
