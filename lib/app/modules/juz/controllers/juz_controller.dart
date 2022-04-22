import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:quran_app/app/data/models/juz.dart';
import 'package:http/http.dart' as http;

class JuzController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isPlay = false.obs;
  Juz? juz;
  var audio = AudioPlayer();
  RxInt nomor = 1.obs;

  fetchJuz(int nomor) async {
    isLoading.value = true;
    this.nomor.value = nomor;
    final response =
        await http.get(Uri.parse('https://api.quran.sutanlab.id/juz/$nomor'));
    if (response.statusCode == 200) {
      juz = Juz.fromJson(jsonDecode(response.body)["data"]);
    } else {
      Get.defaultDialog(
          title: "Terjadi kesalahan", middleText: "Failed to load juz");
    }
    isLoading.value = false;
    isPlay.value = false;
    update();
  }

  void prev(int nomor) {
    isLoading.value = true;
    stopSound();
    fetchJuz(nomor);
  }

  void next(int nomor) {
    isLoading.value = true;
    stopSound();
    fetchJuz(nomor);
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
    juz = null;
    fetchJuz(Get.arguments['nomor']);
  }

  @override
  void onClose() {
    juz = null;
    stopSound();
  }
}
