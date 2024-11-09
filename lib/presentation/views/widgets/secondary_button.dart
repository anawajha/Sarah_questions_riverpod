import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarahah_questions/app/extensions/num.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, this.onPressed, this.child, this.color, this.radius = 8, this.fontSize = 15, this.padding, this.icon});
  final void Function()? onPressed;
  final Widget? child;
  final Widget? icon;
  final Color? color;
  final double radius;
  final double fontSize;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return icon != null ? ElevatedButton.icon(onPressed: onPressed, icon: icon!, label: child ?? const SizedBox(), style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: radius.radius),
        backgroundColor: color ?? Theme.of(context).colorScheme.secondary,
        textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: fontSize.sp, color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.w500),
        padding: padding ?? 8.padding,
        minimumSize: Size(20.w, 10.h),
        maximumSize: Size(double.infinity, 52.h)
      ),) : ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: radius.radius),
        backgroundColor: color ?? Theme.of(context).colorScheme.secondary,
        textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: fontSize.sp, color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.w500),
        padding: padding ?? 8.padding,
        minimumSize: Size(20.w, 10.h),
        maximumSize: Size(double.infinity, 52.h)
      ),
      child: child,
    );
  }
}