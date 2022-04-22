import 'package:get/get.dart';

import '../controllers/juz_controller.dart';

class JuzBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JuzController>(
      () => JuzController(),
    );
  }
}
