import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarahah_questions/app/extensions/num.dart';

class RegisterStepsIndicatorItem extends StatelessWidget {
  const RegisterStepsIndicatorItem({
    super.key,
    required this.selected,
    this.onTap,
  });

  final bool selected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: selected ? 21.w : 12.w,
        height: 8.h,
        margin: 2.2.paddingH,
        decoration: BoxDecoration(
            borderRadius: 6.radius,
            color: selected
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.outlineVariant),
      ),
    );
  }
}
