import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_app/app/constants/color.dart';
import 'package:quran_app/app/constants/font.dart';
import 'package:quran_app/app/data/widgets/bottomNavigationBar.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/app/data/widgets/shimmer.dart';

import '../controllers/schedule_controller.dart';

class ScheduleView extends GetView<ScheduleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Jadwal Sholat",
                  style: darkLabelFont,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.map,
                      color: darkPrimaryFontColor,
                    ),
                    decoration: const BoxDecoration(
                        color: Color(0xff152451), shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rejotangan, Tulungagung",
                          style: darkSemiBoldFont,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Lokasi",
                          style: darkRegularFont,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.calendar_month,
                      color: darkPrimaryFontColor,
                    ),
                    decoration: const BoxDecoration(
                        color: Color(0xff152451), shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Text(
                              DateFormat("dd-MM-yyyy")
                                  .format(controller.selectedDate.value)
                                  .toString(),
                              style: darkSemiBoldFont,
                              overflow: TextOverflow.ellipsis,
                            )),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Tanggal",
                          style: darkRegularFont,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () => controller.chooseDate(),
                      child: const Icon(Icons.edit_calendar)),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: GetBuilder<ScheduleController>(builder: (e) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                            color: const Color(0xff152451),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Imsak',
                              textAlign: TextAlign.center,
                              style: darkNormalFont.copyWith(fontSize: 14),
                            ),
                            controller.isLoading.isTrue
                                ? SizedBox(width: 30, child: builderShimmer(16))
                                : Text(
                                    e.schedule!.jadwal.data.imsak,
                                    textAlign: TextAlign.center,
                                    style:
                                        darkSemiBoldFont.copyWith(fontSize: 14),
                                  )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                            color: const Color(0xff152451),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subuh',
                              textAlign: TextAlign.center,
                              style: darkNormalFont.copyWith(fontSize: 14),
                            ),
                            controller.isLoading.isTrue
                                ? SizedBox(width: 30, child: builderShimmer(16))
                                : Text(
                                    e.schedule!.jadwal.data.subuh,
                                    textAlign: TextAlign.center,
                                    style:
                                        darkSemiBoldFont.copyWith(fontSize: 14),
                                  )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                            color: const Color(0xff152451),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dzuhur',
                              textAlign: TextAlign.center,
                              style: darkNormalFont.copyWith(fontSize: 14),
                            ),
                            controller.isLoading.isTrue
                                ? SizedBox(width: 30, child: builderShimmer(16))
                                : Text(
                                    e.schedule!.jadwal.data.dzuhur,
                                    textAlign: TextAlign.center,
                                    style:
                                        darkSemiBoldFont.copyWith(fontSize: 14),
                                  )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                            color: const Color(0xff152451),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ashar',
                              textAlign: TextAlign.center,
                              style: darkNormalFont.copyWith(fontSize: 14),
                            ),
                            controller.isLoading.isTrue
                                ? SizedBox(width: 30, child: builderShimmer(16))
                                : Text(
                                    e.schedule!.jadwal.data.ashar,
                                    textAlign: TextAlign.center,
                                    style:
                                        darkSemiBoldFont.copyWith(fontSize: 14),
                                  )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                            color: const Color(0xff152451),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Maghrib',
                              textAlign: TextAlign.center,
                              style: darkNormalFont.copyWith(fontSize: 14),
                            ),
                            controller.isLoading.isTrue
                                ? SizedBox(width: 30, child: builderShimmer(16))
                                : Text(
                                    e.schedule!.jadwal.data.maghrib,
                                    textAlign: TextAlign.center,
                                    style:
                                        darkSemiBoldFont.copyWith(fontSize: 14),
                                  )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                            color: const Color(0xff152451),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Isya',
                              textAlign: TextAlign.center,
                              style: darkNormalFont.copyWith(fontSize: 14),
                            ),
                            controller.isLoading.isTrue
                                ? SizedBox(width: 30, child: builderShimmer(16))
                                : Text(
                                    e.schedule!.jadwal.data.isya,
                                    textAlign: TextAlign.center,
                                    style:
                                        darkSemiBoldFont.copyWith(fontSize: 14),
                                  )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: convexAppBar(),
    );
  }
}
