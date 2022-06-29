import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:restow/Constants/colors.dart';
import 'package:restow/Screens/SignUp/sign_up_screen.dart';
import 'package:restow/Widgets/buttons.dart';
import 'package:restow/Widgets/icon.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController confirmnewpasswordController =
      TextEditingController(text: "");
  TextEditingController newpasswordController = TextEditingController(text: "");

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isVisible = false;
  bool iscVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
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
                    "Forgot Password",
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
            SizedBox(height: Get.height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.06, vertical: Get.width * 0.05),
              child: MyButton(
                btntext: "Submit",
                onpress: () {
                  Get.toNamed("/changepassword");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
