import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';

class PickImageDialogButton extends StatelessWidget {
  const PickImageDialogButton({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: 8.radius,
        child: Padding(
          padding: 8.padding,
          child: Column(
            children: [
              Icon(
                icon,
                size: 40.w,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              12.spaceY,
              Text(
                label.tr,
                style: Theme.of(context).textTheme.labelMedium,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
