import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer builderShimmer(double height) {
  return Shimmer.fromColors(
      baseColor: const Color(0xFFEBEBF4),
      highlightColor: const Color.fromARGB(255, 207, 207, 207),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
      ));
}
