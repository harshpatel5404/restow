import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:restow/Constants/colors.dart';
import 'package:restow/Constants/dimension.dart';
import 'package:restow/Screens/Profile/edit_profile.dart';
import 'package:restow/Screens/Profile/profile_controller.dart';
import 'package:restow/Widgets/buttons.dart';
import 'package:restow/Widgets/icon.dart';

import '../Notifications/notifications.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.03, vertical: Get.width * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const AppIcon(
                                icon: Icons.arrow_back,
                              )),
                          SizedBox(
                            width: Get.width * 0.04,
                          ),
                          const Text(
                            "Profile",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: Get.width * 0.04,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(Notifications());
                        },
                        child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  width: 0, color: Colors.white)),
                          elevation: 8,
                          child: Padding(
                              padding: EdgeInsets.all(Get.width * 0.03),
                              child: SvgPicture.asset(
                                "assets/icons/notification.svg",
                                height: 20,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Get.height * 0.7,
                  //
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: Get.width * 0.1,
                            bottom: 0,
                            left: Get.width * 0.05,
                            right: Get.width * 0.05),
                        child: Container(
                          margin: EdgeInsets.only(top: Get.width * 0.05),
                          height: Get.height * 0.6,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 4.0,
                                  spreadRadius: 1),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: Get.width * 0.35,
                        child: Container(
                          height: Get.width * 0.32,
                          width: Get.width * 0.32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(color: kPrimaryColor, width: 3)),
                          child: profileController.image.value != ""
                              ? CircleAvatar(
                                  radius: Get.width * 0.15,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                      profileController.image.value))
                              : CircleAvatar(
                                  radius: Get.width * 0.15,
                                  backgroundColor: Colors.white,
                                  backgroundImage: const AssetImage(
                                    "assets/images/profile.png",
                                  ),
                                ),
                        ),
                      ),
                      Positioned(
                        top: Get.height * 0.2,
                        left: Get.width * 0.095,
                        child: Container(
                          height: mHeight * 0.45,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Get.width * 0.37,
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7.0),
                                      child: Text(
                                        "Driver Name",
                                        style: TextStyle(
                                          color: Color(0xff606060),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ":   ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    width: Get.width * 0.4,
                                    child: Text(
                                      profileController.name.value,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Get.width * 0.37,
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7.0),
                                      child: Text(
                                        "Email",
                                        style: TextStyle(
                                          color: Color(0xff606060),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ":   ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    width: Get.width * 0.4,
                                    child: Text(
                                      profileController.email.value,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: Get.width * 0.37,
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7.0),
                                      child: Text(
                                        "Contact",
                                        style: TextStyle(
                                          color: Color(0xff606060),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ":   ${profileController.contact.value}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Get.width * 0.37,
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7.0),
                                      child: Text(
                                        "Address",
                                        style: TextStyle(
                                          color: Color(0xff606060),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ":   ",
                                    maxLines: 4,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    width: Get.width * 0.4,
                                    child: Text(
                                      "${profileController.address.value}",
                                      maxLines: 4,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: Get.width * 0.37,
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7.0),
                                      child: Text(
                                        "Postcode",
                                        style: TextStyle(
                                          color: Color(0xff606060),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ":   ${profileController.postcode.value}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: Get.width * 0.37,
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7.0),
                                      child: Text(
                                        "Tow Vehicle Brand",
                                        style: TextStyle(
                                          color: Color(0xff606060),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ":   ${profileController.brand.value}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: Get.width * 0.37,
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7.0),
                                      child: Text(
                                        "Tow Vehicle No",
                                        style: TextStyle(
                                          color: Color(0xff606060),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ":   ${profileController.vehicleNo.value}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: Get.width * 0.37,
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7.0),
                                      child: Text(
                                        "Tow Vehicle Type",
                                        style: TextStyle(
                                          color: Color(0xff606060),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ":   ${profileController.vehicleType.value}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.08, vertical: Get.width * 0.04),
                  child: MyButton(
                      onpress: () {
                        Get.to(EditProfile(
                          name: "Johnson Do",
                          phone: "033 2264 1318",
                          address: "Palmar del Sol, 83250 Hermosillo, S...",
                          postcode: "35152",
                          vehicleno: "SD3231",
                        ));
                      },
                      btntext: "Edit Profile"),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
