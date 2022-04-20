import 'package:get/get.dart';
import 'package:quran_app/app/routes/app_pages.dart';

class PageControllerController extends GetxController {
  RxInt index = 0.obs;

  void changePage(int i) async {
    switch (i) {
      case 0:
        index.value = i;
        Get.offAllNamed(Routes.HOME);
        break;
      case 1:
        index.value = i;
        Get.offAllNamed(Routes.QIBLAH);
        break;
      case 2:
        index.value = i;
        Get.offAllNamed(Routes.SCHEDULE);
        break;
      case 3:
        index.value = i;
        Get.offAllNamed(Routes.SCHEDULE);
        break;
      default:
        Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {}
}
