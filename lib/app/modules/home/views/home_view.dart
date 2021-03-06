import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_app/app/constants/color.dart';
import 'package:quran_app/app/constants/font.dart';
import 'package:quran_app/app/data/widgets/bottomNavigationBar.dart';
import 'package:quran_app/app/data/widgets/shimmer.dart';
import 'package:quran_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.sort,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Text(
                    "Quran App",
                    style: darkLabelFont,
                  ),
                  const Spacer(),
                  const Icon(Icons.search)
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Assalamualaikum",
                  style: darkSecondaryRegularFont,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Saudaraku",
                    style: darkNameFont,
                  )),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xffDF98FA), Color(0xff9055FF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.menu_book),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Last Read",
                                    style:
                                        darkNormalFont.copyWith(fontSize: 14),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text("Al-Fatihah",
                                  style:
                                      darkSemiBoldFont.copyWith(fontSize: 18)),
                              const SizedBox(
                                height: 4,
                              ),
                              Text("Ayah No: 1",
                                  style: darkRegularFont.copyWith(fontSize: 14))
                            ],
                          ),
                          Flexible(child: Container())
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: -30,
                        right: -30,
                        child: Image.asset(
                          "assets/images/quran.png",
                          width: 200,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              DefaultTabController(
                length: 2,
                child: Expanded(
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        labelColor: darkPrimaryFontColor,
                        labelStyle: darkSemiBoldFont.copyWith(fontSize: 14),
                        indicatorColor: darkSecondaryColor,
                        tabs: const <Widget>[
                          Tab(
                            text: "Surah",
                          ),
                          Tab(
                            text: "Juz",
                          )
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            GetBuilder<HomeController>(builder: (controller) {
                              if (controller.isLoading.value) {
                                return ListView.builder(
                                    itemCount: 3,
                                    itemBuilder: (context, index) => Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 16),
                                        child: builderShimmer(16)));
                              }
                              return ListView(
                                children: controller.surah
                                    .map(
                                      (e) => GestureDetector(
                                        onTap: () => Get.toNamed(Routes.SURAH,
                                            arguments: {
                                              "nomor": e.number,
                                            }),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color:
                                                          Color(0xff7B80AD)))),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Row(
                                            children: [
                                              Text("${e.number}"),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      e.name.transliteration.id,
                                                      style: darkSemiBoldFont
                                                          .copyWith(
                                                              fontSize: 14),
                                                    ),
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      "${e.revelation.id} ${e.numberOfVerses} ayat",
                                                      style:
                                                          darkSecondaryNormalFont
                                                              .copyWith(
                                                                  fontSize: 12),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                e.name.short,
                                                style: darkSecondaryBoldFont
                                                    .copyWith(fontSize: 20),
                                                textAlign: TextAlign.right,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              );
                            }),
                            ListView.builder(
                                itemCount: 30,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                      onTap: () =>
                                          Get.toNamed(Routes.JUZ, arguments: {
                                        "nomor": index + 1,
                                      }),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color(0xff7B80AD)))),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16),
                                        child: Row(
                                          children: [
                                            Text("${index + 1}"),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Juz ${index + 1}",
                                                  style: darkSemiBoldFont
                                                      .copyWith(fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: convexAppBar(),
    );
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
            "??????????????????????",
            style: darkSecondaryBoldFont.copyWith(fontSize: 20),
          )
        ],
      ),
    );
  }
}
