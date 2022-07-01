import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:restow/Screens/Payments/add_bank_accout.dart';
import 'package:restow/Widgets/buttons.dart';
import 'package:restow/Widgets/icon.dart';
import 'package:restow/Widgets/text_widget.dart';

class BankAccount extends StatefulWidget {
  const BankAccount({Key? key}) : super(key: key);

  @override
  State<BankAccount> createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  var ischecked = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: Get.height * 0.2,
                  width: Get.width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height * 0.175,
                        width: Get.width,
                        child: Card(
                          elevation: 8,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: Get.width * 0.05,
                              bottom: Get.width * 0.05,
                              left: Get.width * 0.05,
                              right: Get.width * 0.03,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "John doe",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        ischecked = index;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: Get.width * 0.08,
                                        width: Get.width * 0.08,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Card(
                                          elevation: 3,
                                          child: ischecked == index
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: SvgPicture.asset(
                                                    "assets/icons/mark.svg",
                                                    color: Color(0xff7892D6),
                                                  ),
                                                )
                                              : SizedBox(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TextWidget(
                                    text1: "Account No : ",
                                    text2: "3521215112"),
                                TextWidget(
                                    text1: "IFSC Code : ", text2: "SBIN5212"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: Get.width * 0.05,
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60),
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white)),
                            elevation: 8,
                            child: Padding(
                                padding: EdgeInsets.all(Get.width * 0.04),
                                child: SvgPicture.asset(
                                  "assets/icons/delete.svg",
                                  height: 20,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(Get.width * 0.04),
          child: MyButton(
              onpress: () {
                Get.to(AddBankAccount());
              },
              btntext: "Add Bank Account"),
        )
      ],
    );
  }
}
