import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restow/Widgets/icon.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
