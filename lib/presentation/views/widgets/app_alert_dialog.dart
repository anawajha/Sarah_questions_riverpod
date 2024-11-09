import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({required this.title,
      this.body,
      required this.positiveButtonText,
      required this.positiveButtonOnPressed,
      this.negativeButtonText,
      this.negativeButtonOnPressed, super.key});

      final String title;
      final String? body;
      final String positiveButtonText;
      final String? negativeButtonText;
      final void Function() positiveButtonOnPressed;
      final void Function()? negativeButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      titlePadding: EdgeInsets.only(top: 16.h, bottom: 5.h, left: 20.w, right: 20.w),
      actionsPadding: EdgeInsets.only(bottom: 5.h, left: 12.w, right: 12.w),
      contentPadding: EdgeInsets.only(top: 18.h, bottom: 5.h, left: 20.w, right: 20.w),
      actionsAlignment: MainAxisAlignment.start,
      title: Text(
        title,
        style: body != null ? Theme.of(context).textTheme.headlineMedium : Theme.of(context).textTheme.bodyLarge,
        maxLines: 10,
        textAlign: TextAlign.center,
      ),
      content: body == null ? null : Text(
        body!,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 15.sp),
        maxLines: 5
      ),
      actions: [
        TextButton(
            onPressed: positiveButtonOnPressed,
            child: Text(positiveButtonText)),
        Visibility(
            visible:
                negativeButtonOnPressed != null && negativeButtonText != null,
            child: TextButton(
                onPressed: negativeButtonOnPressed,
                style: Theme.of(context).textButtonTheme.style?.copyWith(
                  textStyle: WidgetStatePropertyAll(Theme.of(context).textTheme.bodyLarge),
                    foregroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.onSurface)),
                child: Text(negativeButtonText ?? ''))),
      ],
    );
  }
}