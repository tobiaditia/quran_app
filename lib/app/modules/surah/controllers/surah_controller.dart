import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/app/data/models/surah_detail.dart';

class SurahController extends GetxController {
  RxBool isLoading = false.obs;
  DetailSurah? surah;
  fetchSurah(int nomor) async {
    isLoading.value = true;
    final response =
        await http.get(Uri.parse('https://equran.id/api/surat/$nomor'));

    if (response.statusCode == 200) {
      surah = DetailSurah.fromJson(jsonDecode(response.body));
    } else {
      Get.defaultDialog(
          title: "Terjadi kesalahan", middleText: "Failed to load surah");
    }
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    surah = null;
    fetchSurah(Get.arguments['nomor']);
  }

  @override
  void onClose() {
    surah = null;
  }
}
