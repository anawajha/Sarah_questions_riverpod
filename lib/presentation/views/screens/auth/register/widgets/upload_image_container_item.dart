import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/presentation/views/widgets/clickable.dart';

class UploadImageContainerItem extends StatelessWidget {
  const UploadImageContainerItem({
    super.key,
    required this.label,
    required this.hint,
    this.onTap,
    this.content,
  });

  final String label;
  final String hint;
  final void Function()? onTap;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsetsDirectional.only(start: 24.w),
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.start,
            )),
        14.spaceY,
        Clickable(
          radius: 30,
          onClilc: onTap,
          child: SizedBox(
            height: 144.h,
            width: double.infinity,
            child: Material(
              borderRadius: 30.radius,
              color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
              clipBehavior: Clip.antiAlias,
              child: content ??
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Iconsax.cloud_plus,
                          size: 40.w,
                          color: Theme.of(context).colorScheme.outlineVariant),
                      double.infinity.spaceX,
                      6.spaceY,
                      Text(
                        hint,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.outlineVariant,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
