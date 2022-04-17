import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_app/app/constants/color.dart';
import 'package:quran_app/app/constants/font.dart';
import 'package:quran_app/app/modules/home/views/home_view.dart';
import 'package:shimmer/shimmer.dart';

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
                    onTap: () => Get.off(HomeView()),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  GetBuilder<SurahController>(
                      builder: (e) => Text(
                            e.surah == null ? '----' : e.surah!.namaLatin,
                            style: darkLabelFont,
                          )),
                  const Spacer(),
                  const Icon(Icons.search)
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
                      child: e.isLoading.value
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
                                  e.surah!.namaLatin,
                                  style: darkNormalFont.copyWith(fontSize: 26),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  e.surah!.arti,
                                  style: darkNormalFont.copyWith(fontSize: 16),
                                ),
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
                                Text(
                                  "${e.surah!.tempatTurun} ${e.surah!.jumlahAyat} ayat",
                                  style: darkNormalFont.copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    e.isLoading.value
                        ? const Text('wait')
                        : SizedBox(
                            height: Get.height - (390),
                            child: ListView(
                                children: e.surah!.ayat
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
                                                          const EdgeInsets.all(
                                                              2),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              darkSecondaryColor),
                                                      child: Text(
                                                        '${ee.nomor}',
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
                                                      Icon(
                                                        Icons.bookmark_outline,
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
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                ee.ar,
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
                                                ee.idn,
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
                                            const SizedBox(height: 24,)
                                          ],
                                        ))
                                    .toList()),
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

  Container builderCont() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xff7B80AD)))),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const Text("1"),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Al-Fatihah",
                style: darkSemiBoldFont.copyWith(fontSize: 14),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "MECCAN 7 VERSES",
                style: darkSecondaryNormalFont.copyWith(fontSize: 12),
              )
            ],
          ),
          const Spacer(),
          Text(
            "الْفَاتِحَة",
            style: darkSecondaryBoldFont.copyWith(fontSize: 20),
          )
        ],
      ),
    );
  }

  Shimmer builderShimmer(double height) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white30,
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
        ));
  }
}
