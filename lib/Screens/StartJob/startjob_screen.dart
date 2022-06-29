import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restow/Widgets/buttons.dart';
import 'package:restow/Widgets/icon.dart';
import 'package:restow/Widgets/text_widget.dart';

import '../../Constants/colors.dart';
import '../Accept/accept_screen.dart';

class StartJobScreen extends StatefulWidget {
  const StartJobScreen({Key? key}) : super(key: key);

  @override
  State<StartJobScreen> createState() => _StartJobScreenState();
}

class _StartJobScreenState extends State<StartJobScreen> {
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
                height: Get.height * 0.7,
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
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "Johnson doe make a payment of \$500.",
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xffA1AA94),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: Get.height * 0.045,
                                backgroundImage:
                                    AssetImage("assets/images/person.png"),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    " John doe",
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextWidget(
                                    text1: " Contact No : ",
                                    text2: "632145121",
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: Get.width * 0.1,
                              ),
                              CircleAvatar(
                                radius: 22,
                                backgroundColor: Color(0xff3E61B9),
                                child: Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ),
                              )
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
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextWidget(
                            text1: " Verification Code : ",
                            text2: "2253",
                            text2color: Colors.black,
                          ),
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
                        SizedBox(
                          height: Get.height * 0.02,
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
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: TextWidget(
                            text1: "Payment : ",
                            text1bold: FontWeight.bold,
                            text2: "Receved",
                            text2color: Colors.black,
                          ),
                        ),
                        MyButton(
                            onpress: () {
                              Get.toNamed("/completejob");
                            },
                            btntext: "Start Service"),
                        const SizedBox(
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
