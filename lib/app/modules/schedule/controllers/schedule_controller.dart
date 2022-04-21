import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:quran_app/app/data/models/schedule.dart';

class ScheduleController extends GetxController {
  var selectedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;
  Schedule? schedule;

  fetchSchedule(String? date) async {
    isLoading.value = true;
    date = date ?? DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();
    final response = await http.get(Uri.parse(
        'https://api.banghasan.com/sholat/format/json/jadwal/kota/768/tanggal/$date'));
    if (response.statusCode == 200) {
      schedule = Schedule.fromJson(jsonDecode(response.body));
    } else {
      Get.defaultDialog(
          title: "Terjadi kesalahan", middleText: "Failed to load surah");
    }
    isLoading.value = false;
    update();
  }

  @override
  void onClose() {}

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        //initialEntryMode: DatePickerEntryMode.input,
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Pilih Tanggal',
        cancelText: 'Batal',
        confirmText: 'Konfirmasi',
        errorFormatText: 'Masukkan Tanggal dengan Benar',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'Masukkan Tanggal',
        fieldHintText: 'Month/Date/Year',
        selectableDayPredicate: disableDate);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      fetchSchedule(
          DateFormat("yyyy-MM-dd").format(selectedDate.value).toString());
    }
    update();
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(const Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(const Duration(days: 5))))) {
      return true;
    }
    return false;
  }

  @override
  void onInit() {
    super.onInit();
    fetchSchedule(null);
  }
}
