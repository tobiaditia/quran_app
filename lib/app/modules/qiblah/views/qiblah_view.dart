import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:quran_app/app/data/widgets/bottomNavigationBar.dart';

import '../controllers/qiblah_controller.dart';

class QiblahView extends GetView<QiblahController> {
  final _compassSvg = SvgPicture.asset('assets/svg/compass.svg');
  final _needleSvg = SvgPicture.asset(
    'assets/svg/needle.svg',
    fit: BoxFit.contain,
    height: 300,
    alignment: Alignment.center,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QiblahView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'QiblahView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: convexAppBar(),
    );
  }
}
