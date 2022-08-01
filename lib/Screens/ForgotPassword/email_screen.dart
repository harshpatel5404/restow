import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restow/Constants/colors.dart';
import 'package:restow/Constants/dimension.dart';
import 'package:restow/Screens/ForgotPassword/forgotpassword.dart';
import 'package:restow/Screens/SignUp/sign_up_screen.dart';
import 'package:restow/Services/api_service.dart';
import 'package:restow/Widgets/buttons.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  TextEditingController emailController = TextEditingController(text: "");
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
              height: Get.height * 0.1,
            ),
            Text(
              "Enter Your Email",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: Get.height * 0.08),
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
                ],
              ),
            ),
            SizedBox(),
            Expanded(child: SizedBox()),
            MyButton(
              btntext: "Submit",
              onpress: () {
                if (formkey.currentState!.validate()) {
                  print("valid"); 
                  sendOtpforgotpassword(emailController.text.trim());
                }
              },
            ),
            SizedBox(
              height: Get.height * 0.03,
            )
          ],
        ),
      ),
    );
  }
}
