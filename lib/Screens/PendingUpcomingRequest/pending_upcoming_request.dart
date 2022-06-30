import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:restow/Constants/colors.dart';
import 'package:restow/Screens/Notifications/notifications.dart';
import 'package:restow/Widgets/icon.dart';

import '../../Widgets/text_widget.dart';

class PendingUpcomingRequest extends StatefulWidget {
   bool ispending;
  PendingUpcomingRequest({Key? key, required this.ispending}) : super(key: key);

  @override
  State<PendingUpcomingRequest> createState() => _PendingUpcomingRequestState();
}

class _PendingUpcomingRequestState extends State<PendingUpcomingRequest> {
  bool ispendingreq = true;

  @override
  void initState() {
    super.initState();
    ispendingreq = widget.ispending;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: Get.height * 0.06,
            bottom: Get.height * 0.01),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(Notifications());
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(Notifications());
                  },
                  child: Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(width: 0, color: Colors.white)),
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
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width * 0.45,
                    height: Get.height * 0.08,
                    child: ElevatedButton(
                      onPressed: () {
                        ispendingreq = !ispendingreq;
                        setState(() {});
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: !ispendingreq
                            ? MaterialStateProperty.all<Color>(
                                Color(0xffF4F4F4))
                            : MaterialStateProperty.all<Color>(kPrimaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      child: Text(
                        "Pending Request",
                        style: TextStyle(
                            fontSize: 14,
                            color: !ispendingreq
                                ? Color(0xff858585)
                                : Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width * 0.45,
                    height: Get.height * 0.08,
                    child: ElevatedButton(
                      onPressed: () {
                        ispendingreq = !ispendingreq;
                        setState(() {});
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: ispendingreq
                            ? MaterialStateProperty.all<Color>(
                                Color(0xffF4F4F4))
                            : MaterialStateProperty.all<Color>(kPrimaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      child: Text(
                        "Upcoming Request",
                        style: TextStyle(
                            fontSize: 13.5,
                            color: ispendingreq
                                ? Color(0xff858585)
                                : Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Get.height * 0.72,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " Jonson Doe",
                            style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " 23-05-2022  |  10:00 AM",
                            style: TextStyle(
                              color: Color(0xff868686),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      TextWidget(text1: " Contact No : ", text2: "632145121"),
                      TextWidget(
                          text1: " Vehicle Number : ", text2: "SDI31212"),
                      TextWidget(
                          text1: " Vehicle Wheel : ", text2: "4 Wheeler"),
                      Divider()
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
