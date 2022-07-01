import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restow/Constants/colors.dart';
import 'package:restow/Screens/SignIn/sign_in_screen.dart';
import 'package:restow/Screens/VerifyOtp/verify_otp.dart';
import 'package:restow/Widgets/buttons.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  TextEditingController confirmpasswordController =
      TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isVisible = false;
  bool iscVisible = false;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Get.width * 0.08),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              Text(
                "Create New Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
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
                        labelText: "Driver Name",
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
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "Phone Number",
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
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "johnsondoe@gmail.com",
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
                      obscureText: !isVisible,
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Password",
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
                      controller: confirmpasswordController,
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        hintText: "Confirm Password",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    side: BorderSide(
                      color: Color(0xffE4E4E4),
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text(
                    "I Agree to Terms & Conditions.",
                    style: TextStyle(
                      color: Color(0xff515050),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              MyButton(
                btntext: "Submit",
                onpress: () {
                  Get.toNamed("verifyotp");
                },
              ),
              SizedBox(height: Get.height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Color(0xff515050),
                      fontSize: 14,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(SignInPage());
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              )
            ],
          ),
        ),
      ),
    );
  }
}
