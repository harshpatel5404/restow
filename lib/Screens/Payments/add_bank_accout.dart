import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restow/Widgets/buttons.dart';

import '../../Constants/colors.dart';
import '../../Widgets/icon.dart';

class AddBankAccount extends StatefulWidget {
  const AddBankAccount({Key? key}) : super(key: key);

  @override
  State<AddBankAccount> createState() => _AddBankAccountState();
}

class _AddBankAccountState extends State<AddBankAccount> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController accountNoController = TextEditingController(text: "");
  TextEditingController ifscController = TextEditingController(text: "");
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool isChecked = false;

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
                  "Bank Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 23,
                  ),
                ),add
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(Get.width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.02),
                Text(
                  "Add New Debit/Credit Card",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: Get.height * 0.04),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: textcolor,
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "john",
                          labelStyle: TextStyle(color: Color(0xff969696)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff333333),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffE4E4E4),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.04),
                      TextFormField(
                        cursorColor: textcolor,
                        controller: accountNoController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Account No",
                          hintText: "Account No",
                          labelStyle: TextStyle(color: Color(0xff969696)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff333333),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffE4E4E4),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.04),
                      TextFormField(
                        cursorColor: textcolor,
                        controller: ifscController,
                        decoration: InputDecoration(
                          labelText: "IFSC Code",
                          hintText: "IFSC Code",
                          labelStyle: TextStyle(color: Color(0xff969696)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff333333),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffE4E4E4),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              isChecked = !isChecked;
                              setState(() {});
                            },
                            child: Container(
                              height: Get.width * 0.08,
                              width: Get.width * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Card(
                                elevation: 3,
                                child: isChecked
                                    ? Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: SvgPicture.asset(
                                          "assets/icons/mark.svg",
                                          color: Color(0xff7892D6),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Text(
                            " Mark as a default ",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.1),
                      MyButton(
                        onpress: () {},
                        btntext: "Submit",
                      ),
                      SizedBox(height: Get.height * 0.05),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
