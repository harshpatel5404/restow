import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:restow/Widgets/icon.dart';

class RatingReviewScreen extends StatefulWidget {
  RatingReviewScreen({Key? key}) : super(key: key);

  @override
  State<RatingReviewScreen> createState() => _RatingReviewScreenState();
}

class _RatingReviewScreenState extends State<RatingReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(Get.height * 0.15), // here the desired height
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.03, vertical: Get.width * 0.02),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back,
                    )),
                SizedBox(
                  width: Get.width * 0.04,
                ),
                Text(
                  "Rating & Review",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 23,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // height: Get.height * 0.45,
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: Get.width * 0.2,
                            width: Get.width * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/rate.png',
                                ),
                                fit: BoxFit.contain,
                              ),
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(50.0)),
                              border: new Border.all(
                                color: Color(0xffC4C4C4),
                                width: 1.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " John doe",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                " info@johndeo.com",
                                style: TextStyle(
                                  color: Color(0xffA8A8A8),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0xffDDDDDD),
                        height: Get.height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              " Booking ID : XXXXX",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              " Date & Time : 05/05/2020, 03:00 PM",
                              style: TextStyle(
                                color: Color(0xff7E7E7E),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Color(0xffDDDDDD),
                        height: Get.height * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            " Rating :",
                            style: TextStyle(
                              color: Color(0xff7E7E7E),
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RatingBar(
                            initialRating: 4,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            ignoreGestures: true,
                            itemCount: 5,
                            itemSize: Get.width * 0.07,
                            ratingWidget: RatingWidget(
                              full: Container(
                                height: Get.height * 0.02,
                                width: Get.height * 0.02,
                                child: Image.asset(
                                  'assets/images/fullrate.png',
                                ),
                              ),
                              empty: Image.asset(
                                'assets/images/emptyrate.png',
                              ),
                              half: SizedBox(),
                            ),
                            itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Review :",
                              style: TextStyle(
                                color: Color(0xff7E7E7E),
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
                              style: TextStyle(
                                color: Color(0xffA8A8A8),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
