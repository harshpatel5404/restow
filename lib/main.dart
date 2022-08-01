import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:restow/Screens/ForgotPassword/email_screen.dart';
import 'package:restow/Screens/ForgotPassword/forgotpassword.dart';
import 'package:restow/Screens/SignUp/sign_up_screen.dart';
import 'Constants/colors.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 3)).then((value) => FlutterNativeSplash.remove());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: EmailScreen(),
    );
  }
}
