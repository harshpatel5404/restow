import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restow/Screens/Home/home_screen.dart';
import 'package:restow/Screens/SignIn/sign_in_screen.dart';
import 'package:restow/Screens/VerifyOtp/verify_otp.dart';
import 'package:restow/Widgets/snackbar.dart';

import 'shared_preference_service.dart';

var baseUrl = "https://nodeserver.mydevfactory.com:7099";

Future signup(name, email, phone, password) async {
  try {
    final response = await http.post(Uri.parse('$baseUrl/user/signup'),
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
        },
        body: json.encode({
          "email": email,
          "password": password,
          "confirmPassword": password,
          "fullName": name,
          "phone": phone,
          "role": "Driver",
          "isSignUpFromMob": true
        }),
        encoding: Encoding.getByName('utf-8'));

    if (response.statusCode == 200) {
      var responsedata = jsonDecode(response.body);
      print(responsedata);
      if (responsedata["msg"] == "Email Already Exist") {
        showCustomSnackBar(responsedata["msg"]);
      } else {
        await setuserid(responsedata["data"]["userId"].toString());
        await setUserinfo(email: email, name: name, phone: phone);
        showCustomSnackBar(responsedata["msg"], isError: false);
        Get.to(const VerifyOtp());
      }
    }
  } on SocketException {
    showCustomSnackBar("No Internet connection");
  } on TimeoutException {
    showCustomSnackBar("Connection Time Out!");
  } catch (e) {
    print(e.toString());
    showCustomSnackBar(e.toString());
  }
}

Future verifyOtp(otp) async {
  var userid = await getuserid();
  print(userid);
  print(otp);
  try {
    final response =
        await http.post(Uri.parse("$baseUrl/user/verifyOtp/$userid/$otp"),
            headers: {
              "Content-Type": "application/json",
            },
            encoding: Encoding.getByName('utf-8'));

    if (response.statusCode == 200) {
      var responsedata = jsonDecode(response.body);
      print(responsedata);
      showCustomSnackBar(responsedata["msg"], isError: false);
      Get.off(SignInPage());
    } else {
      var responsedata = jsonDecode(response.body);
      print("incorrecrt");
      showCustomSnackBar(responsedata["msg"]);
    }
  } on SocketException {
    showCustomSnackBar("No Internet connection");
  } on TimeoutException {
    showCustomSnackBar("Connection Time Out!");
  } catch (e) {
    print(e.toString());
    showCustomSnackBar(e.toString());
  }
}

Future login(email, password) async {
  try {
    final response = await http.post(Uri.parse('$baseUrl/user/login'),
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
        },
        body: json.encode({
          "email": email,
          "password": password,
        }),
        encoding: Encoding.getByName('utf-8'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responsedata = jsonDecode(response.body);
      print(responsedata);
      var name = responsedata["data"]["user"]["fullName"];
      var phone = responsedata["data"]["user"]["phone"];
      var userid = responsedata["data"]["user"]["_id"];
      await setuserid(userid);
      await setToken(responsedata['data']['token']);
      await setUserinfo(email: email, name: name, phone: phone);
      showCustomSnackBar("Login Successfully", isError: false);

      Get.offAll(const HomeScreen());
    } else {
      var responsedata = jsonDecode(response.body);
      showCustomSnackBar(responsedata["msg"]);
      print(responsedata);
    }
  } on SocketException {
    showCustomSnackBar("No Internet connection");
  } on TimeoutException {
    showCustomSnackBar("Connection Time Out!");
  } catch (e) {
    print(e.toString());
    showCustomSnackBar(e.toString());
  }
}
