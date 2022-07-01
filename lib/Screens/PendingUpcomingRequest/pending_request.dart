import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restow/Screens/Accept/accept_screen.dart';
import 'package:restow/Widgets/text_widget.dart';

class PendingRequest extends StatefulWidget {
  const PendingRequest({Key? key}) : super(key: key);

  @override
  State<PendingRequest> createState() => _PendingRequestState();
}

class _PendingRequestState extends State<PendingRequest> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.to(AcceptScreen());
            },
            child: Column(
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
                TextWidget(text1: " Vehicle Number : ", text2: "SDI31212"),
                TextWidget(text1: " Vehicle Wheel : ", text2: "4 Wheeler"),
                Divider()
              ],
            ),
          );
        },
      ),
    );
  }
}
