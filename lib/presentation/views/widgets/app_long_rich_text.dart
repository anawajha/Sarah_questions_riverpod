import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppLongRichText extends StatelessWidget {
  const AppLongRichText({
    super.key,
    this.style,
    required this.strings,
    this.onPressed,
    this.textAlign = TextAlign.center,
  });

  final List<String> strings;
  final TextStyle? style;
  final void Function()? onPressed;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      locale: Get.locale,
      textAlign: textAlign,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
          text: strings.first.tr,
          style: style ?? Theme.of(context)
                          .textTheme
                          .labelLarge!.copyWith(
                              fontSize: 15.sp),
          children: List.generate(
              strings.length,
              (index) => (index == 0
                  ? const TextSpan()
                  : (index == 1
                      ? TextSpan(
                          text: " ${strings[index].tr} ",
                          style: (style ?? Theme.of(context)
                          .textTheme
                          .labelLarge)!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15.sp),
                          recognizer: TapGestureRecognizer()..onTap = onPressed)
                      : TextSpan(text: strings[index].tr, style: style))))),
    );
  }
}
