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

        ///İletişim 1
        InkWell(
          onTap: () {
            if (addressList[2].startsWith("Tel")) {
              print(addressList[2]
                  .replaceAll(" ", "")
                  .replaceAll("(", "")
                  .replaceAll(")", "")
                  .replaceAll("Tel:", ""));

              launch(
                  "tel://${addressList[2].replaceAll(" ", "").replaceAll("(", "").replaceAll(")", "").replaceAll("Tel:", "")}");
            } else {
              launch("mailto:${addressList[2]}");
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  addressList[2].startsWith("Tel") ? Icons.phone : Icons.mail,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 10),
                Container(
                  alignment: Alignment.center,
                  width: telTextWidth,
                  child: Text(
                    addressList[2],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            if (addressList[3].startsWith("Tel")) {
              print(addressList[3]
                  .replaceAll(" ", "")
                  .replaceAll("(", "")
                  .replaceAll(")", "")
                  .replaceAll("Tel:", ""));

              launch(
                  "tel://${addressList[3].replaceAll(" ", "").replaceAll("(", "").replaceAll(")", "").replaceAll("Tel:", "")}");
            } else {
              launch("mailto:${addressList[3]}");
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  addressList[3].startsWith("Tel") ? Icons.phone : Icons.mail,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 10),
                Container(
                  alignment: Alignment.center,
                  width: telTextWidth,
                  child: Text(
                    addressList[3],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  final double telTextWidth = 200;
}
