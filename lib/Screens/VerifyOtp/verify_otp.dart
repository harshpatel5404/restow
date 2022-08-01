import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:restow/Constants/colors.dart';
import 'package:restow/Constants/dimension.dart';
import 'package:restow/Services/api_service.dart';
import 'package:restow/Widgets/buttons.dart';
import 'package:restow/Widgets/icon.dart';
import 'package:restow/Widgets/snackbar.dart';

import 'verify_otp_controller.dart';

class VerifyOtp extends StatefulWidget {
  final bool isForgot;
  const VerifyOtp({
    Key? key,
    required this.isForgot,
  }) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  OtpFieldController otpFieldController = OtpFieldController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  VerifyOtpController verifyOtpController = Get.put(VerifyOtpController());

  String otp = "";
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (verifyOtpController.secondsRemaining.value != 0) {
        verifyOtpController.secondsRemaining.value--;
      } else {
        verifyOtpController.enableResend.value = true;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  void resendCode() {
    verifyOtpController.secondsRemaining.value = 30;
    verifyOtpController.enableResend.value = false;
    resendOtpCode();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.03, vertical: Get.width * 0.04),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: AppIcon(
                          icon: Icons.arrow_back,
                        )),
                    SizedBox(
                      width: Get.width * 0.04,
                    ),
                    Text(
                      "Verify",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/verify.png",
                      height: Get.height * 0.2,
                      width: Get.height * 0.15,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/dot.png",
                      height: Get.height * 0.09,
                      width: Get.height * 0.2,
                    ),
                  ),
                ],
              ),
              Text(
                "Verification",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              Text(
                "Code has been sent to your email",
                style: TextStyle(
                  color: Color(0xff959595),
                  fontSize: 14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: EdgeInsets.all(Get.width * 0.04),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(children: [
                    OTPTextField(
                        controller: otpFieldController,
                        length: 4,
                        width: MediaQuery.of(context).size.width,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: Get.width * 0.14,
                        fieldStyle: FieldStyle.box,
                        outlineBorderRadius: 10,
                        style: TextStyle(
                            fontSize: 17,
                            color: textcolor,
                            fontWeight: FontWeight.bold),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.width * 0.04),
                        otpFieldStyle: OtpFieldStyle(
                          borderColor: textcolor,
                          focusBorderColor: textcolor,
                          enabledBorderColor: Color(0xff212121),
                          disabledBorderColor: Colors.black38,
                        ),
                        onChanged: (pin) {},
                        onCompleted: (pin) {
                          setState(() {
                            otp = pin;
                          });
                        }),
                  ]),
                ),
              ),
              SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.1, vertical: Get.width * 0.05),
                child: MyButton(
                  btntext: "Submit",
                  onpress: () {
                    if (otp.length != 4) {
                      showCustomSnackBar("Fill the OTP fields");
                    } else {
                      int otptext = int.parse(otp);

                      EasyLoading.show();
                      verifyOtp(otp, widget.isForgot).whenComplete(() {
                        EasyLoading.removeAllCallbacks();
                        EasyLoading.dismiss();
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: mWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "If OTP code is not received?  ",
                      style: TextStyle(
                        color: Color(0xff515050),
                        fontSize: 14,
                      ),
                    ),
                    verifyOtpController.enableResend.value
                        ? InkWell(
                            onTap: () {
                              resendCode();
                            },
                            child: Text(
                              "Resend",
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : Text(
                            "Resend",
                            style: TextStyle(
                                color: Color(0xff000000).withOpacity(0.4),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                  ],
                ),
              ),
              SizedBox(),
              Center(
                child: Text(
                  "Resend code after ${verifyOtpController.secondsRemaining.value} seconds",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.withOpacity(0.7),
                      fontFamily: "Poppins"),
                ),
              ),
              SizedBox(
                height: Get.height * 0.09,
              )
            ],
          ),
        ),
      ),
    );
  }
}
