import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restow/Widgets/icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: InkWell(
                onTap: () {
                  Get.toNamed("/accept");
                },
                child: Image.asset("assets/images/splash.png")),
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
                    AppIcon(
                      icon: Icons.menu,
                    ),
                    Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              BorderSide(width: 0, color: Colors.white)),
                      elevation: 6,
                      child: Container(
                        height: Get.width * 0.14,
                        width: Get.width * 0.37,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Switch(
                              onChanged: (val) {
                                isSwitched = !isSwitched;
                                setState(() {});
                              },
                              value: isSwitched,
                              activeColor: Color(0xff3E61B9),
                              activeTrackColor: Color(0xffB1C3EF),
                              inactiveThumbColor: Color(0xffABABAB),
                              inactiveTrackColor: Color(0xffDEDEDE),
                            ),
                            !isSwitched
                                ? Text(
                                    "Offline",
                                    style: TextStyle(
                                      color: Color(0xff3E61B9),
                                      fontSize: 15,
                                    ),
                                  )
                                : Text(
                                    "Online",
                                    style: TextStyle(
                                      color: Color(0xff3E61B9),
                                      fontSize: 15,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    AppIcon(
                      icon: Icons.notifications,
                    ),
                  ],
                ),
              ),
              !isSwitched
                  ? Container(
                      height: Get.height * 0.13,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Color(0xff3E61B9),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.05,
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: Color(0xffABABAB),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.04,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "You are offline! ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Go online to start accepting jobs.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}
