import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_app/app/constants/font.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (_) =>  Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.all(30),
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                width: 195,
                child: Column(
                  children: [
                    Text(
                      "Quran App",
                      style: darkTitleFont,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Learn Quran and Recite once everyday",
                      style: darkSecondaryRegularFont.copyWith(
                          height: 1.2, letterSpacing: 1.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/home.png',
                width: double.infinity,
              )
            ],
          ),
        )),
      )),
    );
  }
}
