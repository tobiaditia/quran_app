import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/qiblah/bindings/qiblah_binding.dart';
import '../modules/qiblah/views/qiblah_view.dart';
import '../modules/schedule/bindings/schedule_binding.dart';
import '../modules/schedule/views/schedule_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/surah/bindings/surah_binding.dart';
import '../modules/surah/views/surah_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      transition: Transition.fadeIn,
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: _Paths.SURAH,
      page: () => SurahView(),
      binding: SurahBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: _Paths.SCHEDULE,
      page: () => ScheduleView(),
      binding: ScheduleBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: _Paths.QIBLAH,
      page: () => QiblahView(),
      binding: QiblahBinding(),
    ),
  ];
}
