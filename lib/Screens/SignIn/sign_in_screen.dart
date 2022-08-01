import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restow/Constants/colors.dart';
import 'package:restow/Constants/dimension.dart';
import 'package:restow/Screens/ForgotPassword/email_screen.dart';
import 'package:restow/Screens/ForgotPassword/forgotpassword.dart';
import 'package:restow/Screens/SignUp/sign_up_screen.dart';
import 'package:restow/Services/api_service.dart';
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
            const Text(
              "Sign in to continue!",
              style: const TextStyle(
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
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Email is not valid';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "johnsondoe@gmail.com",
                      labelStyle: const TextStyle(color: Color(0xff969696)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color(0xff333333),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: const Color(0xffE4E4E4),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Password",
                      labelStyle: const TextStyle(color: Color(0xff969696)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color(0xff333333),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
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
                            ? const Icon(
                                Icons.visibility_off,
                                color: Color(0xffC6C6C6),
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Color(0xffC6C6C6),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(),
            MyButton(
              btntext: "Submit",
              onpress: () {
                if (formkey.currentState!.validate()) {
                  print("valid");

                  login(emailController.text.trim(),
                      passwordController.text.trim());
                }
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: mWidth * 0.06),
              child: InkWell(
                onTap: () {
                  Get.to(const EmailScreen());
                },
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: Color(0xff959595),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don’t have an account? ",
                  style: TextStyle(
                    color: Color(0xff515050),
                    fontSize: 14,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const SignUpPage());
                  },
                  child: const Text(
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
