import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:restow/Constants/colors.dart';
import 'package:restow/Screens/SignUp/sign_up_screen.dart';
import 'package:restow/Widgets/buttons.dart';
import 'package:restow/Widgets/icon.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

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
             ],
          ),
        ),
      ),
    );
  }
}
