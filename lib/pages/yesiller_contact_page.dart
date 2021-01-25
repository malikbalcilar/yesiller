import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
            borderSide:
                BorderSide(width: 1, color: Colors.white)),
        labelStyle: TextStyle(color: Colors.white,fontSize: 16),
        filled: true,
        labelText: label);
  }

  List<String> _form = ["İsim", "Soyisim", "Telefon", "E-posta", "Mesaj"];

  GoogleMapController controller;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return KalipArka(
        initialAnimate: false,
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

                    Container(
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15,top:35),
                            child: Container(height: 37,
                              width: 110,
                              child: RaisedButton(textColor: Color(0xFF042a1d),
                                onPressed: (){},
                                child: Text("Gönder",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900
                                ),),
                                color: Color(0xFFfbd5e2),
                              ),
                            ),
                          ),
                        ],
                      ),
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
        ));
  }
}
