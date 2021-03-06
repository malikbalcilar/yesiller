import 'dart:convert';
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:responsive_page/responsive_page.dart';

import '../src/addresses.dart';
import '../widgets/address_widget.dart';
import '../widgets/kaliparka.dart';

///
class YesillerContactPage extends StatefulWidget {
  ///
  const YesillerContactPage({Key key}) : super(key: key);

  @override
  _YesillerContactPageState createState() => _YesillerContactPageState();
}

class _YesillerContactPageState extends ResponsiveState<YesillerContactPage> {
  InputDecoration inputDecoration(String label) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 0.5, color: Colors.white.withOpacity(1))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.white)),
        labelStyle: const TextStyle(color: Colors.white, fontSize: 16),
        filled: true,
        labelText: label);
  }

  final List<String> _form = ["İsim", "Soyisim", "Telefon", "E-posta", "Mesaj"];

  List<TextEditingController> editingControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  GoogleMapController controller;

  bool sending = false;


  void _showSnack(String mesaj) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(mesaj),
      duration: const Duration(seconds: 5),
    ));
  }

  Widget _iletisimFormu({bool mobile = false}) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 50,
        left: 30,
      ),
      child: Column(
        children: [
          const SizedBox(height: 90),
          Text(
            "İLETİŞİM FORMU",
            style: TextStyle(
              color: Colors.white,
              fontSize: mobile ? 19 : 23,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              color: Colors.white,
              height: 1,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: _form
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextField(
                          controller: editingControllers[_form.indexOf(e)],
                          cursorWidth: 1,
                          cursorColor: const Color(0xFFFFFFFF).withOpacity(0.8),
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
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    textColor: const Color(0xFF042a1d),
                    onPressed: () async {
                      ///
                      var emailLocalValid = editingControllers[3].text !=
                              null &&
                          (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(editingControllers[3].text));

                      if (!emailLocalValid) {
                        _showSnack("Lütfen Geçerli Bir Mail Adresi Girin");
                        return;
                      }

                      ///
                      var nameValid = editingControllers[0].text != null &&
                          RegExp(r'^[a-zA-Z ğüşöçİĞÜŞÖÇ]+$')
                              .hasMatch(editingControllers[0].text);

                      if (!nameValid) {
                        _showSnack("Lütfen Geçerli Bir İsim Girin");
                        return;
                      }

                      ///
                      var lastNameValid = editingControllers[1].text != null &&
                          RegExp(r'^[a-zA-Z ğüşöçİĞÜŞÖÇ]+$')
                              .hasMatch(editingControllers[1].text);

                      if (!lastNameValid) {
                        _showSnack("Lütfen Geçerli Bir Soyisim Girin");
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
                        _showSnack("Lütfen Geçerli Bir Telefon Numarası Girin");
                        return;
                      }

                      var messageValid = editingControllers[4].text != null &&
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
                                fontSize: 16, fontWeight: FontWeight.w900),
                          ),
                    color: const Color(0xFFfbd5e2),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   var size = MediaQuery.of(context).size;
  //   return KalipArka(
  //       initialAnimate: false,
  //       child: SingleChildScrollView(
  //         child: Row(
  //           children: [
  //             Expanded(
  //               flex: 3,
  //               child: _iletisimFormu(),
  //             ),
  //             Expanded(
  //               flex: 5,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(top: 90),
  //                 child: Container(height: 500, child: buildGoogleMap()),
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.symmetric(horizontal: 20),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: [buildAddress1(), buildAddress2()],
  //               ),
  //             )
  //           ],
  //         ),
  //       ));
  // }

  InkWell buildAddress1() {
    return InkWell(
      onTap: () {
        if (controller != null) {
          controller.animateCamera(CameraUpdate.newLatLngZoom(
              larende, 14.5));

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
    );
  }

  InkWell buildAddress2() {
    return InkWell(
      onTap: () async {
        if (controller != null) {
          await controller.animateCamera(CameraUpdate.newLatLngZoom(
              meram, 14.5));
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
    );
  }

  LatLng larende =const LatLng(37.86591461202069, 32.494190141016446);


  LatLng meram = const LatLng(37.85888198303, 32.46770083799785);




  Widget buildGoogleMap() {
    return GestureDetector(
      onVerticalDragUpdate: (_) {},
      onScaleUpdate: (_) {},
      child: GoogleMap(
        markers: {
          Marker(
              markerId: MarkerId("larende"),
              position: larende,
              infoWindow: const InfoWindow(title: "Larende Şube", snippet: "YEŞİLLER KÖMÜR"),
              onTap: () {
                if (controller != null) {
                  controller.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          zoom: 14.5,
                          target:
                          larende)));
                }
              }),
          Marker(
              markerId: MarkerId("meram"),
              position: meram,
              infoWindow: const InfoWindow(title: "Meram Şube", snippet: "YEŞİLLER KÖMÜR"),
              onTap: () {
                if (controller != null) {
                  controller.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          zoom: 14.5,
                          target:
                              meram)));
                }
              }),
        },
        mapType: MapType.normal,
        initialCameraPosition:  const CameraPosition(
            target:LatLng(37.86319488439623, 32.48249596219935)
            ,
            zoom: 14,
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
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return KalipArka(
        initialAnimate: false,
        child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: _iletisimFormu(),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Container(height: 500, child: buildGoogleMap()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [buildAddress1(), buildAddress2()],
                ),
              )
            ],
          ),
        ));
  }

  bool isHover = false;

  @override
  Widget buildMobile(BuildContext context) {
    return KalipArka(
        initialAnimate: false,
        child: SingleChildScrollView(
          physics: isHover
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    buildAddress1(),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 0.3,
                      width: double.infinity,
                      color: Colors.white.withOpacity(0.5),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    buildAddress2(),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 0.3,
                      width: double.infinity,
                      color: Colors.white.withOpacity(0.5),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
                child: MouseRegion(
                    onHover: (_) {
                      setState(() {
                        isHover = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        isHover = false;
                      });
                    },
                    child: Container(height: 500, child: buildGoogleMap())),
              ),
              _iletisimFormu(mobile: true),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ));
  }

  @override
  Widget buildWideMobileOrTablet(BuildContext context) {
    return buildMobile(context);
  }

  @override
  Widget buildWideTabletOrDesktop(BuildContext context) {
    return buildMobile(context);
  }
}
