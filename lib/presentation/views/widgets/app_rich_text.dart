import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({
    super.key,
    required this.first,
    required this.last,
    this.onPressed,
    this.style,
    this.textAlign = TextAlign.center,
  });

  final TextStyle? style;
  final String first;
  final String last;
  final void Function()? onPressed;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      locale: Get.locale,
      textAlign: textAlign,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(text: first.tr, style: style ?? Theme.of(context).textTheme.labelSmall, children: [
        TextSpan(
            text: " ${last.tr} ",
            style: (style ?? Theme.of(context).textTheme.labelSmall)!
            .copyWith(
                color: Theme.of(context).primaryColor),
            recognizer: TapGestureRecognizer()..onTap = onPressed),
      ]),
    );
  }
}
