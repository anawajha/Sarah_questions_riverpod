import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Clickable extends StatelessWidget {
  const Clickable(
      {super.key, required this.child, this.onClilc, this.color, this.radius});
  final Widget child;
  final void Function()? onClilc;
  final Color? color;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // overlayColor: MaterialStateProperty.all<Color?>(color ??
      //     Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7)),
      borderRadius: BorderRadius.circular(radius?.r ?? 12.r),
      onTap: onClilc,
      child: child,
    );
  }
}
