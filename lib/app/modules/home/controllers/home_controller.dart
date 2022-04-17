import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/app/data/models/surah.dart';

class HomeController extends GetxController {
  List<Surah> surah = [];
  RxBool isLoading = false.obs;

  fetchSurah() async {
    isLoading.value = true;
    final response = await http.get(Uri.parse('https://equran.id/api/surat'));

    if (response.statusCode == 200) {
      surah = Surah.fromJsonList(jsonDecode(response.body));
    } else {
      Get.defaultDialog(
          title: "Terjadi kesalahan", middleText: "Failed to load surah");
    }
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchSurah();
  }

  @override
  void onClose() {}
}
