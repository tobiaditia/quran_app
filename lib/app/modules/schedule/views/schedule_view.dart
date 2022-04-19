import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_app/app/data/widgets/bottomNavigationBar.dart';

import '../controllers/schedule_controller.dart';

class ScheduleView extends GetView<ScheduleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScheduleView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ScheduleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: convexAppBar(),
    );
  }
}
