import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
import 'Constants/colors.dart';
import 'Screens/Splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Driver Restow',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: background,
        fontFamily: 'Roboto',
      ),
      home: SplashScreen(),
    );
  }
}
