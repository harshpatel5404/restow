import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:restow/Constants/dimension.dart';
import 'package:restow/Screens/SignUp/sign_up_screen.dart';

import 'Constants/colors.dart';
import 'Screens/Home/home_screen.dart';
import 'Services/shared_preference_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 3))
      .then((value) => FlutterNativeSplash.remove());
  runApp(MyApp(
      defaultpage: (await getlogin() == true)
          ? const HomeScreen()
          : const SignUpPage()));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 55.0
    ..contentPadding = EdgeInsets.all(mWidth*0.07)
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false;
}

class MyApp extends StatelessWidget {
  final Widget defaultpage;
  const MyApp({Key? key, required this.defaultpage}) : super(key: key);

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
      home: defaultpage,
      builder: EasyLoading.init(),
    );
  }
}
