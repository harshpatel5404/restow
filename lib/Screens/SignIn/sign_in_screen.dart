import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restow/Constants/colors.dart';
import 'package:restow/Screens/ForgotPassword/forgotpassword.dart';
import 'package:restow/Screens/SignUp/sign_up_screen.dart';
import 'package:restow/Widgets/buttons.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(Get.width * 0.08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: Get.height * 0.15,
            ),
            Text(
              "Sign in to continue!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            Form(
              key: formkey,
              child: Column(
                children: [
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
                ],
              ),
            ),
            SizedBox(),
            MyButton(
              btntext: "Submit",
              onpress: () {
                Get.to(SignUpPage());
              },
            ),
            InkWell(
              onTap: () {
                Get.to(ForgotPassword());
              },
              child: Text(
                "Forgot password?",
                style: TextStyle(
                  color: Color(0xff959595),
                  fontSize: 14,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account? ",
                  style: TextStyle(
                    color: Color(0xff515050),
                    fontSize: 14,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(SignUpPage());
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.15,
            )
          ],
        ),
      ),
    );
  }
}
