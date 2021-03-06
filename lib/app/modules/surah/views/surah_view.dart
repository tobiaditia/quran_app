import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_app/app/constants/color.dart';
import 'package:quran_app/app/constants/font.dart';
import 'package:quran_app/app/data/widgets/shimmer.dart';
import 'package:quran_app/app/routes/app_pages.dart';

import '../controllers/surah_controller.dart';

class SurahView extends GetView<SurahController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.stopSound();
                      Get.offAllNamed(Routes.HOME);
                    },
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Obx(() => controller.isLoading.isTrue
                      ? Expanded(child: builderShimmer(16))
                      : Text(
                          controller.surah!.name.transliteration.id,
                          style: darkLabelFont,
                        )),
                  const Spacer(),
                  // GetBuilder<SurahController>(
                  //     builder: (e) => e.surah == null
                  //         ? Expanded(child: builderShimmer(16))
                  //         : GestureDetector(
                  //             onTap: () {
                  //               audio.play(e.surah!.audio);
                  //             },
                  //             child: const Icon(Icons.play_arrow))),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              GetBuilder<SurahController>(builder: (e) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 28, horizontal: 56),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0xffDF98FA), Color(0xff9055FF)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(10)),
                      child: Obx(
                        () => controller.isLoading.isTrue
                            ? Column(
                                children: [
                                  builderShimmer(26),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  builderShimmer(16),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Divider(
                                    thickness: 3,
                                    color: Color.fromRGBO(255, 255, 255, 3.5),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  builderShimmer(14),
                                ],
                              )
                            : Column(
                                children: [
                                  Text(
                                    e.surah!.name.translation.id,
                                    style:
                                        darkNormalFont.copyWith(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "${e.surah!.revelation.id} ${e.surah!.numberOfVerses} ayat",
                                    style:
                                        darkNormalFont.copyWith(fontSize: 14),
                                  ),
                                  // Obx(
                                  //   () => Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       IconButton(
                                  //           iconSize: 30,
                                  //           onPressed: e.surah!
                                  //                       .number ==
                                  //                   1
                                  //               ? null
                                  //               : () => controller
                                  //                   .prev(e.surah!.number - 1),
                                  //           icon: Container(
                                  //             decoration: BoxDecoration(
                                  //                 shape: BoxShape.circle,
                                  //                 color: e.surah!
                                  //                             .number ==
                                  //                         1
                                  //                     ? Colors.grey
                                  //                     : darkPrimaryFontColor),
                                  //             child: Icon(
                                  //               Icons.skip_previous,
                                  //               color: darkSecondaryColor,
                                  //             ),
                                  //           )),
                                  //       e.isPlay.isTrue
                                  //           ? Row(
                                  //               children: [
                                  //                 IconButton(
                                  //                     iconSize: 30,
                                  //                     onPressed: () {
                                  //                       controller.pauseSound();
                                  //                     },
                                  //                     icon: Container(
                                  //                       decoration: BoxDecoration(
                                  //                           shape:
                                  //                               BoxShape.circle,
                                  //                           color:
                                  //                               darkPrimaryFontColor),
                                  //                       child: Icon(
                                  //                         Icons.pause,
                                  //                         color:
                                  //                             darkSecondaryColor,
                                  //                       ),
                                  //                     )),
                                  //                 IconButton(
                                  //                     iconSize: 30,
                                  //                     onPressed: () {
                                  //                       controller.stopSound();
                                  //                     },
                                  //                     icon: Container(
                                  //                       decoration: BoxDecoration(
                                  //                           shape:
                                  //                               BoxShape.circle,
                                  //                           color:
                                  //                               darkPrimaryFontColor),
                                  //                       child: Icon(
                                  //                         Icons.stop,
                                  //                         color:
                                  //                             darkSecondaryColor,
                                  //                       ),
                                  //                     )),
                                  //               ],
                                  //             )
                                  //           : IconButton(
                                  //               iconSize: 50,
                                  //               onPressed: () {
                                  //                 controller.playSound(
                                  //                     e.surah!.audio);
                                  //               },
                                  //               icon: Container(
                                  //                 decoration: BoxDecoration(
                                  //                     shape: BoxShape.circle,
                                  //                     color:
                                  //                         darkPrimaryFontColor),
                                  //                 child: Icon(
                                  //                   Icons.play_arrow,
                                  //                   color: darkSecondaryColor,
                                  //                 ),
                                  //               )),
                                  //       IconButton(
                                  //           iconSize: 30,
                                  //           onPressed: e.surah!
                                  //                       .suratSelanjutnya ==
                                  //                   false
                                  //               ? null
                                  //               : () => controller
                                  //                   .next(e.surah!.nomor + 1),
                                  //           icon: Container(
                                  //             decoration: BoxDecoration(
                                  //                 shape: BoxShape.circle,
                                  //                 color: e.surah!
                                  //                             .suratSelanjutnya ==
                                  //                         false
                                  //                     ? Colors.grey
                                  //                     : darkPrimaryFontColor),
                                  //             child: Icon(
                                  //               Icons.skip_next,
                                  //               color: darkSecondaryColor,
                                  //             ),
                                  //           )),
                                  //     ],
                                  //   ),
                                  // )
                                ],
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Obx(
                      () => controller.isLoading.isTrue
                          ? builderShimmer(26)
                          : SizedBox(
                              height: Get.height - (200),
                              child: ListView(
                                  children: e.surah!.verses
                                      .map((ee) => Column(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 13),
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xff152451),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                        width: 28,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2),
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                darkSecondaryColor),
                                                        child: Text(
                                                          '${ee.number.inSurah}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: darkNormalFont
                                                              .copyWith(
                                                                  fontSize: 14),
                                                        )),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.share_outlined,
                                                          color:
                                                              darkSecondaryColor,
                                                          size: 24,
                                                        ),
                                                        const SizedBox(
                                                          width: 16,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () =>
                                                              controller
                                                                  .playSound(ee
                                                                      .audio
                                                                      .primary),
                                                          child: Icon(
                                                            Icons
                                                                .play_circle_outline_outlined,
                                                            color:
                                                                darkSecondaryColor,
                                                            size: 24,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 16,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .bookmark_outline,
                                                          color:
                                                              darkSecondaryColor,
                                                          size: 24,
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 24,
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  ee.text.arab,
                                                  style: darkArabFont,
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  ee.translation.id,
                                                  style: darkTrFont,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              const Divider(
                                                thickness: 1,
                                                color: Color.fromRGBO(
                                                    255, 255, 255, .2),
                                              ),
                                              const SizedBox(
                                                height: 24,
                                              )
                                            ],
                                          ))
                                      .toList()),
                            ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // Text(e.surah!.ayat[0].ar)
                  ],
                );
              }),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
