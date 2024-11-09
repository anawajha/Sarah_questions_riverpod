import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarahah_questions/app/extensions/num.dart';

class ShimmerContentItem extends StatelessWidget {
  const ShimmerContentItem({
    super.key,
    this.radius,
    required this.width,
    this.height,
    this.color,
  });

  final double? radius;
  final double width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height ?? 14.h,
      decoration: BoxDecoration(
          borderRadius: (radius ?? 6).radius, color: color ?? Colors.black),
    );
  }
}
