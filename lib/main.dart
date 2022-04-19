import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_app/app/constants/color.dart';
import 'package:quran_app/app/controllers/page_controller_controller.dart';

import 'app/routes/app_pages.dart';

void main() {
  final pageController = Get.put(PageControllerController(), permanent: true);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: darkPrimaryColor,
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.blue,
            disabledColor: Colors.grey,
          )),
      darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: darkPrimaryColor,
          brightness: Brightness.dark,
          primaryColor: Colors.amber,
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.amber,
            disabledColor: Colors.grey,
          )),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
