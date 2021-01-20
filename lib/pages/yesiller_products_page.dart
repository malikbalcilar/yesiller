import 'package:flutter/material.dart';

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
      appBar: AppBar(),
      body: const Center(
        child: Text("Ürünler"),
      ),
    );
  }
}