import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/surah_controller.dart';

class SurahView extends GetView<SurahController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SurahView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SurahView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
