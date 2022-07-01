import 'package:flutter/material.dart';
import 'package:restow/Widgets/text_widget.dart';

class UpcomingRequest extends StatefulWidget {
  const UpcomingRequest({Key? key}) : super(key: key);

  @override
  State<UpcomingRequest> createState() => _UpcomingRequestState();
}

class _UpcomingRequestState extends State<UpcomingRequest> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
              TextWidget(text1: " Vehicle Number : ", text2: "SDI31212"),
              TextWidget(text1: " Vehicle Wheel : ", text2: "4 Wheeler"),
              Divider()
            ],
          );
        },
      ),
    );
  }
}
