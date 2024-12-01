import 'package:flutter/material.dart';

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
      insetPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      titlePadding: EdgeInsets.only(top: 16, bottom: 5, left: 20, right: 20),
      actionsPadding: EdgeInsets.only(bottom: 5, left: 12, right: 12),
      contentPadding: EdgeInsets.only(top: 18, bottom: 5, left: 20, right: 20),
      actionsAlignment: MainAxisAlignment.start,
      title: Text(
        title,
        style: body != null ? Theme.of(context).textTheme.headlineMedium : Theme.of(context).textTheme.bodyLarge,
        maxLines: 10,
        textAlign: TextAlign.center,
      ),
      content: body == null ? null : Text(
        body!,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 15),
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