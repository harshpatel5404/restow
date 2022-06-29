import 'package:get/get.dart';
import 'package:restow/Screens/Accept/accept_screen.dart';
import 'package:restow/Screens/ChangePassword/change_password.dart';
import 'package:restow/Screens/ForgotPassword/forgotpassword.dart';
import 'package:restow/Screens/Home/home_screen.dart';
import 'package:restow/Screens/SignIn/sign_in_screen.dart';
import 'package:restow/Screens/SignUp/sign_up_screen.dart';
import 'package:restow/Screens/Splash/splash_screen.dart';

import '../Screens/VerifyOtp/verify_otp.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/signin', page: () => SignInPage()),
    GetPage(name: '/signup', page: () => SignUpPage()),
    GetPage(name: '/verifyotp', page: () => VerifyOtp()),
    GetPage(name: '/forgotpassword', page: () => ForgotPassword()),
    GetPage(name: '/changepassword', page: () => ChangePassword()),
    GetPage(name: '/home', page: () => const HomeScreen()),
    GetPage(name: '/accept', page: () => const AcceptScreen()),
  ];
}
