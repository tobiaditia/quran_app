import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/app/data/models/surah_detail.dart';

class SurahController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isPlay = false.obs;
  DetailSurah? surah;
  var audio = AudioPlayer();

  fetchSurah(int nomor) async {
    isLoading.value = true;
    print(isLoading);
    final response =
        await http.get(Uri.parse('https://equran.id/api/surat/$nomor'));

    if (response.statusCode == 200) {
      surah = DetailSurah.fromJson(jsonDecode(response.body));
    } else {
      Get.defaultDialog(
          title: "Terjadi kesalahan", middleText: "Failed to load surah");
    }
    isLoading.value = false;
    isPlay.value = false;
    update();
  }

  void prev(int nomor){
    isLoading.value = true;
    stopSound();
    fetchSurah(nomor);
  }

  void next(int nomor) {
    isLoading.value = true;
    stopSound();
    fetchSurah(nomor);
  }

  void playSound(String url) async {
    await audio.play(url);
    isPlay.value = true;
    update();
  }

  void pauseSound() async {
    await audio.pause();
    isPlay.value = false;
    update();
  }

  void stopSound() async {
    await audio.stop();
    isPlay.value = false;
    update();
  }

  void resumeSound() async {
    await audio.resume();
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
