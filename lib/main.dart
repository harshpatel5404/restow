import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:restow/Constants/dimension.dart';

import 'Constants/colors.dart';
import 'Screens/Home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 3))
      .then((value) => FlutterNativeSplash.remove());
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 70.0
    ..contentPadding = EdgeInsets.all(mWidth * 0.07)
    ..radius = 15.0
    ..progressColor = Colors.white
    ..backgroundColor = const Color.fromARGB(255, 82, 82, 82).withOpacity(0.7)
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = const Color.fromARGB(96, 71, 71, 71).withOpacity(0.5)
    ..userInteractions = false;
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
      home: HomeScreen(),
      builder: EasyLoading.init(),
    );
  }
}
