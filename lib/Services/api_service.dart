import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restow/Screens/ForgotPassword/forgotpassword.dart';
import 'package:restow/Screens/HomePage/home_screen.dart';
import 'package:restow/Screens/Profile/profile_controller.dart';
import 'package:restow/Screens/SignIn/sign_in_screen.dart';
import 'package:restow/Screens/SignUp/sign_up_controller.dart';
import 'package:restow/Screens/VerifyOtp/verify_otp.dart';
import 'package:restow/Widgets/snackbar.dart';
import 'dart:io' as Io;
import 'shared_preference_service.dart';

var baseUrl = "https://nodeserver.mydevfactory.com:7099";
SignUpController signUpController = Get.put(SignUpController());
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
      signUpController.isLoading.value = false;
      var responsedata = jsonDecode(response.body);
      print(responsedata);
      if (responsedata["msg"] == "Email Already Exist") {
        showCustomSnackBar(responsedata["msg"]);
      } else {
        await setuserid(responsedata["data"]["userId"].toString());
        await setUserinfo(email: email, name: name, phone: phone);
        showCustomSnackBar(responsedata["msg"], isError: false);
        Get.to(const VerifyOtp(
          isForgot: false,
        ));
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

Future resendOtpCode() async {
  var userid = await getuserid();
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/user/resendOtp/$userid'),
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      var responsedata = jsonDecode(response.body);
      showCustomSnackBar(responsedata["msg"], isError: false);
    } else {
      var responsedata = jsonDecode(response.body);
      showCustomSnackBar(responsedata['msg']);
    }
  } on SocketException {
    showCustomSnackBar("No Internet connection");
  } on TimeoutException {
    showCustomSnackBar("Connection Time Out!");
  } catch (e) {
    showCustomSnackBar(e.toString());
  }
}

Future verifyOtp(otp, isforgot) async {
  var userid = await getuserid();
  // print(userid);
  // print(otp);
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
      if (!isforgot) {
        Get.off(SignInPage());
      } else {
        Get.off(ForgotPassword());
      }
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
  ProfileController profilecontroller = Get.put(ProfileController());
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
      var email = responsedata["data"]["user"]["email"];
      var userid = responsedata["data"]["user"]["_id"];

      profilecontroller.name.value = name;
      profilecontroller.email.value = email;
      profilecontroller.contact.value = phone;

      await setuserid(userid);
      await setlogin(true);
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

Future sendOtpforgotpassword(email) async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/user/sendOtp/$email'),
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responsedata = jsonDecode(response.body);
      print(responsedata);
      await setuserid(responsedata["data"]["userId"].toString());
      showCustomSnackBar(responsedata["msg"], isError: false);
      Get.to(const VerifyOtp(
        isForgot: true,
      ));
    } else {
      var responsedata = jsonDecode(response.body);
      showCustomSnackBar(responsedata['msg']);
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

Future forgotPassword(password, cpassword, {isChangepass = false}) async {
  var userid = await getuserid();
  try {
    final response =
        await http.post(Uri.parse('$baseUrl/user/forgotPassword/$userid'),
            headers: {
              "Content-Type": "application/json",
              'Accept': 'application/json',
            },
            body: json.encode({
              "password": password,
              "confirmPassword": cpassword,
            }),
            encoding: Encoding.getByName('utf-8'));

    if (response.statusCode == 200) {
      var responsedata = jsonDecode(response.body);
      print(responsedata);
      showCustomSnackBar(responsedata['msg'], isError: false);
      if (isChangepass) {
        Get.back();
      } else {
        Get.offAll(SignInPage());
      }
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

Future getProfileDetails() async {
  var token = await getToken();
  print(token);
  print("getprofile");
  ProfileController profilecontroller = Get.put(ProfileController());
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/user/driverProfile'),
      headers: {
        "Content-Type": "application/json; charset=utf-8",
        "x-access-token": token.toString()
        // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyZTI2ZGJkMjVlZDkyM2ZlODYwZDYwNSIsImlhdCI6MTY1OTM0MjcxNCwiZXhwIjoxNjY5NzEwNzE0fQ.ra26oNDhjhht_OG6gSkJVCPDnOb98zO8D9Cut_12HJ4"
      },
    );
    if (response.statusCode == 200) {
      var responsedata = jsonDecode(response.body);
      print(responsedata);
      var data = responsedata['data'];
      profilecontroller.name.value = data['fullName'];
      profilecontroller.email.value = data['email'];
      profilecontroller.contact.value = data['phone'];
      profilecontroller.address.value = data['address'];
      profilecontroller.postcode.value = data['postcode'].toString();
      profilecontroller.brand.value = data['towVehicleBrand'];
      profilecontroller.vehicleNo.value = data['towVehicleNumber'].toString();
      profilecontroller.vehicleType.value = data['towVehicleType'];
      profilecontroller.image.value = data['photo'];
    } else {
      var responsedata = jsonDecode(response.body);
    }
  } on SocketException {
    showCustomSnackBar("No Internet connection");
  } on TimeoutException {
    showCustomSnackBar("Connection Time Out!");
  } catch (e) {
    print(e);
    // showCustomSnackBar(e.toString());
  }
}

Future updateProfile(data) async {
  // ProfileController profileController = Get.put(ProfileController());
  var token = await getToken();
  var img;
  // if (photo != null) {
  // List<int> imageBytes = photo.readAsBytesSync();
  // String base64Image = base64Encode(imageBytes);
  // var img = "data:image/jpg;base64,$base64Image";
  // print(base64Image);
  // }

//   final bytes = Io.File(imageBytes.path).readAsBytesSync();
// String img64 = base64Encode(bytes);

  try {
    final response = await http.put(Uri.parse('$baseUrl/user/driverProfile'),
        headers: {
          "Content-Type": "application/json; charset=utf-8",
          "x-access-token": token!
          // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyZTI2ZGJkMjVlZDkyM2ZlODYwZDYwNSIsImlhdCI6MTY1OTM0MjcxNCwiZXhwIjoxNjY5NzEwNzE0fQ.ra26oNDhjhht_OG6gSkJVCPDnOb98zO8D9Cut_12HJ4"
        },
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'));

    if (response.statusCode == 200) {
      var responsedata = jsonDecode(response.body);
      print(responsedata);
    } else {
      var responsedata = jsonDecode(response.body);
      print(responsedata);
      showCustomSnackBar(responsedata['msg']);
    }
  } on SocketException {
    showCustomSnackBar("No Internet connection");
  } on TimeoutException {
    showCustomSnackBar("Connection Time Out!");
  } catch (e) {
    print(e.toString());
    showCustomSnackBar(e.toString());
  }

  // final data = {
  //   'fullName': fullName,
  //   'phone': phone,
  //   'address': address,
  //   'postcode': postcode,
  //   'towVehicleBrand': towVehicleBrand,
  //   'towVehicleNumber': towVehicleNumber,
  //   'towVehicleType': towVehicleType,
  // "photo": await http.MultipartFile.fromPath(
  //   "photo",
  //   photo!.path,
  //   // contentType: MediaType
  //   //  contentType:  MediaType('image', 'png')
  // ),
  // await dio.MultipartFile.fromFile(photo.path, filename: "myphoto.jpg")
  // };
  // dio.FormData formData = dio.FormData.fromMap(data);
  // try {
  //   dio.Dio dio1 = dio.Dio();
  //   dio.Response response = await dio1.put(
  //     "$baseUrl/user/updateProfile",
  //     data: formData,
  //     options: dio.Options(
  //       headers: {
  //         "Accept": "application/json",
  //         // "Content-Type": "multipart/form-data",
  //         "x-access-token":
  //             "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyZTI2ZGJkMjVlZDkyM2ZlODYwZDYwNSIsImlhdCI6MTY1OTM0MjcxNCwiZXhwIjoxNjY5NzEwNzE0fQ.ra26oNDhjhht_OG6gSkJVCPDnOb98zO8D9Cut_12HJ4"
  //       },
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     print("200");
  //     print(response.data);
  //   } else {
  //     print(response.data.toString());
  //   }
  // } catch (e) {
  //   print("ERROR");
  //   print(e.toString());
  // }
}
