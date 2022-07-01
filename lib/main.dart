import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restow/Screens/CompleteJob/complete_job.dart';
import 'package:restow/Screens/ForgotPassword/forgotpassword.dart';
import 'package:restow/Screens/Home/home_screen.dart';
import 'package:restow/Screens/PendingUpcomingRequest/pending_upcoming_request.dart';
import 'package:restow/Screens/VerifyOtp/verify_otp.dart';

import 'Constants/colors.dart';
import 'Routes/app.routes.dart';
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
      initialRoute: '/',
      getPages: AppRoutes.routes,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: background,
        fontFamily: 'Roboto',
      ),
      home: SplashScreen(),
    );
  }
}
