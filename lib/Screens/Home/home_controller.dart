import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:restow/Services/api_service.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    EasyLoading.show();
    getProfileDetails().whenComplete(() {
      EasyLoading.removeAllCallbacks();
      EasyLoading.dismiss();
      Get.back();
    });
    super.onInit();
  }
}
