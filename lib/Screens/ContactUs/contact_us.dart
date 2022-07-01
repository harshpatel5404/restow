import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restow/Widgets/buttons.dart';

import '../../Constants/colors.dart';
import '../../Widgets/icon.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  TextEditingController msgController = TextEditingController(text: "");
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                  "Contact Us",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 23,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(Get.width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "You can contact us on the following email address and phone number.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15, height: 1.5, color: Color(0xff808080)),
                ),
                SizedBox(height: Get.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/email.svg",
                          height: Get.height * 0.04,
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        Text(
                          "johndoe@gmail.com",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/call.svg",
                          height: Get.height * 0.04,
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        Text(
                          "3562121512",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.03),
                Divider(),
                SizedBox(height: Get.height * 0.02),
                Text(
                  "Connect with Us",
                  style: TextStyle(
                    fontSize: 18,
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
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: "Phone",
                          hintText: "Phone",
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
                        controller: msgController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: "Message",
                          hintText: "Message",
                          labelStyle: TextStyle(
                              color: Color(
                            0xff969696,
                          )),
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
                      MyButton(
                        onpress: () {},
                        btntext: "Submit",
                      ),
                      SizedBox(height: Get.height * 0.03),
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
