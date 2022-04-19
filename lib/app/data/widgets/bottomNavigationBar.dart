import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/app/constants/color.dart';
import 'package:quran_app/app/controllers/page_controller_controller.dart';

final pageController = Get.find<PageControllerController>();

ConvexAppBar convexAppBar() {
  return ConvexAppBar(
    backgroundColor: const Color(0xff152451),
    activeColor: darkSecondaryColor,
    style: TabStyle.react,
    color: darkFourthFontColor,
    items: const [
      TabItem(
        icon: Icons.menu_book_outlined,
      ),
      TabItem(
        icon: Icons.mosque_outlined,
      ),
      TabItem(icon: Icons.timer_outlined),
      TabItem(
        icon: Icons.dark_mode_outlined,
      ),
    ],
    initialActiveIndex: pageController.index.value,
    onTap: (int i) => pageController.changePage(i),
  );
}
