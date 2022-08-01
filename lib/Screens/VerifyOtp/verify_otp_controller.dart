import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  RxInt secondsRemaining = 30.obs;
  RxBool enableResend = false.obs;
}