import 'dart:async';

import 'package:get/get.dart';
import 'package:quran_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () => Get.toNamed(Routes.HOME));
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
