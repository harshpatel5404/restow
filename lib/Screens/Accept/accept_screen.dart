import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restow/Screens/StartJob/startjob_screen.dart';
import 'package:restow/Widgets/buttons.dart';
import 'package:restow/Widgets/drawer_menu.dart';
import 'package:restow/Widgets/icon.dart';
import 'package:restow/Widgets/text_widget.dart';

import '../../Constants/colors.dart';
import '../Notifications/notifications.dart';

class AcceptScreen extends StatefulWidget {
  const AcceptScreen({Key? key}) : super(key: key);

  @override
  State<AcceptScreen> createState() => _AcceptScreenState();
}

class _AcceptScreenState extends State<AcceptScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: MyDrawer(),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(62.750411, 26.140096),
              zoom: 3,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: Get.height * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        scaffoldkey.currentState!.openDrawer();
                      },
                      child: AppIcon(
                        icon: Icons.menu,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Notifications());
                      },
                      child: Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(width: 0, color: Colors.white)),
                        elevation: 8,
                        child: Padding(
                            padding: EdgeInsets.all(Get.width * 0.03),
                            child: SvgPicture.asset(
                              "assets/icons/notification.svg",
                              height: 20,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          width: Get.width * 0.8,
                          alignment: Alignment.center,
                          child: const Text(
                            "Johnson doe send you a tow request with vahicale no DS321521. ",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffA1AA94),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: Get.height * 0.045,
                              backgroundImage:
                                  AssetImage("assets/images/person.png"),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: Get.width * 0.7,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        " John doe",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "22-05-2022  |  10:00 AM",
                                        style: TextStyle(
                                          color: Color(0xffA1AA94),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TextWidget(
                                  text1: " Contact No : ",
                                  text2: "632145121",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      TextWidget(
                        text1: " Vehicle No : ",
                        text2: "SD25132",
                      ),
                      TextWidget(
                        text1: " Vehicle Brand : ",
                        text2: "HONDA",
                      ),
                      TextWidget(
                        text1: " Vehicle Type : ",
                        text2: "PICKUP TRUCK",
                      ),
                      TextWidget(
                        text1: " Vehicle Wheel : ",
                        text2: "3 Wheeler",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "Battery Replacement, Clutch Replacement",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Divider(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyButton(
                              onpress: () {
                                Get.to(StartJobScreen());
                              },
                              widths: Get.width * 0.42,
                              btntext: "Accept"),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: kPrimaryColor.withOpacity(0.3),
                                  blurRadius: 5.0,
                                  offset: Offset(0.0, 8.0),
                                ),
                              ],
                            ),
                            width: Get.width * 0.42,
                            height: Get.height * 0.08,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        kPrimaryColor),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(
                                          color: Color(0xff3E61B9), width: 1)),
                                ),
                              ),
                              child: Text(
                                "Reject",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
