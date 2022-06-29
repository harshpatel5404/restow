import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restow/Widgets/buttons.dart';
import 'package:restow/Widgets/icon.dart';

import '../../Constants/colors.dart';

class AcceptScreen extends StatefulWidget {
  const AcceptScreen({Key? key}) : super(key: key);

  @override
  State<AcceptScreen> createState() => _AcceptScreenState();
}

class _AcceptScreenState extends State<AcceptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/splash.png"),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: Get.height * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(
                      icon: Icons.menu,
                    ),
                    AppIcon(
                      icon: Icons.notifications,
                    ),
                  ],
                ),
              ),
              Container(
                height: Get.height * 0.6,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: Get.width * 0.8,
                            alignment: Alignment.center,
                            child: Text(
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
                        Align(
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
                        Text(
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
                                onpress: () {},
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: BorderSide(
                                            color: Color(0xff3E61B9),
                                            width: 1)),
                                  ),
                                ),
                                child: Text(
                                  "Reject",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
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

class TextWidget extends StatelessWidget {
  final String text1;
  final String text2;
  const TextWidget({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text(
            text1,
            style: TextStyle(
              color: Color(0xffA1AA94),
              fontSize: 13,
            ),
          ),
          Text(
            text2,
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
