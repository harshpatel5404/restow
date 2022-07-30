import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restow/Screens/SignIn/sign_in_screen.dart';
import 'package:restow/Screens/SignUp/sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff8f8f8),
      body: InkWell(
        onTap: () {
          Get.to(SignUpPage());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: Get.height * 0.35,
              width: Get.width * 0.6,
              child: Image.asset("assets/images/restow.png"),
            ),
            Column(
              children: [
                Container(
                  width: Get.width,
                  child: Image.asset("assets/images/splash.png"),
                ),
                SizedBox(
                  height: Get.height * 0.06,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
