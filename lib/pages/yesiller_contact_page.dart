import 'dart:convert';
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:yesiller/src/addresses.dart';
import 'package:yesiller/widgets/address_widget.dart';
import 'package:yesiller/widgets/kaliparka.dart';

///
class YesillerContactPage extends StatefulWidget {
  ///
  const YesillerContactPage({Key key}) : super(key: key);

  @override
  _YesillerContactPageState createState() => _YesillerContactPageState();
}

class _YesillerContactPageState extends State<YesillerContactPage> {
  InputDecoration inputDecoration(String label) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 0.5, color: Colors.white.withOpacity(1))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.white)),
        labelStyle: TextStyle(color: Colors.white, fontSize: 16),
        filled: true,
        labelText: label);
  }

  List<String> _form = ["İsim", "Soyisim", "Telefon", "E-posta", "Mesaj"];

  List<TextEditingController> editingControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  GoogleMapController controller;

  bool sending = false;

  _showSnack(String mesaj) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(mesaj),
      duration: Duration(seconds: 5),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return KalipArka(
        initialAnimate: false,
        child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 50, left: 30,),
                  child: Column(

                    children: [
                      SizedBox(height: 90),
                      Text("İLETİŞİM FORMU",style: TextStyle(color: Colors.white,fontSize: 23),),


                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          color: Colors.white,
                          height: 1,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: _form
                              .map((e) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 10),
                                    child: TextField(
                                      controller:
                                          editingControllers[_form.indexOf(e)],
                                      cursorWidth: 1,
                                      cursorColor: const Color(0xFFFFFFFF)
                                          .withOpacity(0.8),
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 18),
                                      decoration: inputDecoration(e),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15, top: 35),
                            child: Container(
                              height: 37,
                              width: 110,
                              child: RaisedButton(
                                textColor: Color(0xFF042a1d),
                                onPressed: () async {
                                  ///
                                  var emailLocalValid = editingControllers[3]
                                              .text !=
                                          null &&
                                      (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(editingControllers[3].text));

                                  if (!emailLocalValid) {
                                    _showSnack(
                                        "Lütfen Geçerli Bir Mail Adresi Girin");
                                    return;
                                  }

                                  ///
                                  var nameValid = editingControllers[0].text !=
                                          null &&
                                      RegExp(r'^[a-zA-Z ğüşöçİĞÜŞÖÇ]+$')
                                          .hasMatch(editingControllers[0].text);

                                  if (!nameValid) {
                                    _showSnack("Lütfen Geçerli Bir İsim Girin");
                                    return;
                                  }

                                  ///
                                  var lastNameValid = editingControllers[1]
                                              .text !=
                                          null &&
                                      RegExp(r'^[a-zA-Z ğüşöçİĞÜŞÖÇ]+$')
                                          .hasMatch(editingControllers[1].text);

                                  if (!lastNameValid) {
                                    _showSnack(
                                        "Lütfen Geçerli Bir Soyisim Girin");
                                    return;
                                  }

                                  var v = editingControllers[2].text;

                                  var phoneValid = v != null &&
                                      v.isNotEmpty &&
                                      (v[0] == "0" ||
                                          v[0] == "9" ||
                                          v[0] == "5" ||
                                          v[0] == "+") &&
                                      ((v[0] == "0" && v.length == 11) ||
                                          (v[0] == "5" && v.length == 10) ||
                                          (v[0] == "+" && v.length == 13) ||
                                          (v[0] == "9" && v.length == 12));

                                  if (!phoneValid) {
                                    _showSnack(
                                        "Lütfen Geçerli Bir Telefon Numarası Girin");
                                    return;
                                  }

                                  var messageValid =
                                      editingControllers[4].text != null &&
                                          editingControllers[4].text.isNotEmpty;

                                  if (!messageValid) {
                                    _showSnack("Lütfen Geçerli Bir Mesaj Girin");
                                    return;
                                  }

                                  setState(() {
                                    sending = true;
                                  });

                                  await post(
                                      "https://us-central1-yesiller.cloudfunctions.net/sendMail",
                                      headers: {
                                        'Accept': 'application/json',
                                        'Content-Type': 'application/json'
                                      },
                                      body: json.encode({
                                        "name": editingControllers[0].text,
                                        "secondName": editingControllers[1].text,
                                        "mail": editingControllers[3].text,
                                        "telefon": editingControllers[2].text,
                                        "mesaj": editingControllers[4].text
                                      }));

                                  for (var co in editingControllers) {
                                    co.clear();
                                  }

                                  setState(() {
                                    sending = false;
                                  });
                                },
                                child: sending
                                    ? Container(
                                        height: 20,
                                        width: 20,
                                        child: const CircularProgressIndicator())
                                    : const Text(
                                        "Gönder",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                      ),
                                color: Color(0xFFfbd5e2),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [SizedBox(height: 50,),
                    Container(
                      height: 500,
                      width: 700,
                      child: GoogleMap(
                        markers: {
                          Marker(
                              markerId: MarkerId("dukkanmark"),
                              position: LatLng(37.82713741627923, 32.43678031363905),
                              infoWindow: InfoWindow(title: "Dükkan", snippet: "sn"),
                              onTap: () {
                                if (controller != null) {
                                  controller.animateCamera(
                                      CameraUpdate.newCameraPosition(CameraPosition(
                                          zoom: 14.5,
                                          target: LatLng(37.82713741627923,
                                              32.43678031363905))));
                                }
                              }),
                          Marker(
                              markerId: MarkerId("dukkanmark2"),
                              position: LatLng(37.83607030763146, 32.425440365702485),
                              infoWindow:
                                  InfoWindow(title: "Dükkan2", snippet: "buyruuun"),
                              onTap: () {
                                if (controller != null) {
                                  controller.animateCamera(
                                      CameraUpdate.newCameraPosition(CameraPosition(
                                          zoom: 14.5,
                                          target: LatLng(37.83607030763146,
                                              32.425440365702485))));
                                }
                              }),
                        },
                        mapType: MapType.normal,
                        initialCameraPosition: const CameraPosition(
                            target: LatLng(37.84729678686463, 32.443346361307505),
                            zoom: 13.5,
                            bearing: 0,
                            tilt: 60.0),
                        onTap: (l) {
                          print(l);
                        },
                        onMapCreated: (cont) {
                          setState(() {
                            controller = cont;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        if (controller != null) {
                          controller.animateCamera(CameraUpdate.newLatLngZoom(
                              LatLng(37.82713741627923, 32.43678031363905),
                              14.5));

//                        controller.animateCamera(
//                            CameraUpdate.newCameraPosition(CameraPosition(
//                                zoom: 14.5,
//                                target: LatLng(
//                                    37.82713741627923, 32.43678031363905))));
                        }
                      },
                      child: AddressWidget(
                        addressList: address1,
                      ),
                    ),

//                    const SizedBox(
//                      width: 60,
//                    ),

                    InkWell(
                      onTap: () async {
                        if (controller != null) {
                          controller.animateCamera(CameraUpdate.newLatLngZoom(
                              LatLng(37.83607030763146, 32.425440365702485),
                              14.5));

//                        controller.animateCamera(
//                            CameraUpdate.newCameraPosition(CameraPosition(
//                                zoom: 14.5,
//                                target: LatLng(
//                                    37.83607030763146, 32.425440365702485))));
                        }
                      },
                      child: AddressWidget(
                        addressList: address2,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
