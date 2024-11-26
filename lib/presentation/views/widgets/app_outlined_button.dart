import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton(
      {super.key,
      this.color,
      this.onPressed,
      required this.child,
      this.textStyle,
      this.padding});

  final Color? color;
  final void Function()? onPressed;
  final Widget child;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: color,
          elevation: 0,
          padding: padding,
          side: BorderSide(
            color: color ?? Theme.of(context).colorScheme.primary,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          minimumSize: Size(double.infinity, 57),
          textStyle: (textStyle ?? Theme.of(context).textTheme.labelMedium)
              ?.copyWith(color: color)),
      child: child,
    );
  }
}
