import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:restow/Constants/colors.dart';
import 'package:restow/Screens/Home/home_screen.dart';
import 'package:restow/Screens/SignUp/sign_up_screen.dart';
import 'package:restow/Widgets/buttons.dart';
import 'package:restow/Widgets/icon.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController confirmnewpasswordController =
      TextEditingController(text: "");
  TextEditingController newpasswordController = TextEditingController(text: "");
  TextEditingController oldpasswordController = TextEditingController(text: "");

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isVisible = false;
  bool iscVisible = false;
  bool isoldVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.03, vertical: Get.width * 0.04),
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
                      "Change Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/lock.png",
                      height: Get.height * 0.2,
                      width: Get.height * 0.15,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/dot.png",
                      height: Get.height * 0.09,
                      width: Get.height * 0.2,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(Get.width * 0.06),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.04),
                      TextFormField(
                        cursorColor: textcolor,
                        obscureText: !isoldVisible,
                        controller: oldpasswordController,
                        decoration: InputDecoration(
                          labelText: "Type Old Password",
                          hintText: "Type Old Password",
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
                          suffixIcon: InkWell(
                            onTap: () {
                              isoldVisible = !isoldVisible;
                              setState(() {});
                            },
                            child: isoldVisible
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Color(0xffC6C6C6),
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Color(0xffC6C6C6),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.04),
                      TextFormField(
                        cursorColor: textcolor,
                        obscureText: !isVisible,
                        controller: newpasswordController,
                        decoration: InputDecoration(
                          labelText: "Type New Password",
                          hintText: "Type New Password",
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
                          suffixIcon: InkWell(
                            onTap: () {
                              isVisible = !isVisible;
                              setState(() {});
                            },
                            child: isVisible
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Color(0xffC6C6C6),
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Color(0xffC6C6C6),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.04),
                      TextFormField(
                        cursorColor: textcolor,
                        obscureText: !iscVisible,
                        controller: confirmnewpasswordController,
                        decoration: InputDecoration(
                          labelText: "Retype New Password",
                          hintText: "Retype New Password",
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
                          suffixIcon: InkWell(
                            onTap: () {
                              iscVisible = !iscVisible;
                              setState(() {});
                            },
                            child: iscVisible
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Color(0xffC6C6C6),
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Color(0xffC6C6C6),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: Get.height * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.06, vertical: Get.width * 0.05),
                child: MyButton(
                  btntext: "Submit",
                  onpress: () {
                    Get.to(HomeScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
