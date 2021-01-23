import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

///
class AddressWidget extends StatelessWidget {
  ///
  const AddressWidget({Key key, this.addressList}) : super(key: key);

  ///
  final List<String> addressList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          addressList[0],
          style: const TextStyle(height: 5, color: Colors.white, fontSize: 18),
        ),
        Text(
          addressList[1],
          style: const TextStyle(color: Colors.white, fontSize: 15),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 28,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkResponse(
                onTap: () {
                  launch("tel://905530635063");
                },
                child: const Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                alignment: Alignment.center,
                width: telTextWidth,
                child: Text(
                  addressList[2],
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.phone_android,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: 10),
              Container(
                alignment: Alignment.center,
                width: telTextWidth,
                child: Text(
                  addressList[3],
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.home,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(width: 10),
            Container(
              alignment: Alignment.center,
              width: telTextWidth,
              child: Text(
                addressList[4],
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ],
    );
  }


  final double telTextWidth = 200;


}
