import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/config/svg_manager.dart';
import 'package:sarahah_questions/presentation/views/widgets/image_svg.dart';

class TransparentLogoBackground extends StatelessWidget {
  const TransparentLogoBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.bottomStart,
        child: Transform.flip(
          flipX: Directionality.of(context) == TextDirection.ltr,
          child: ImageSvg(
            SvgManager().settingBackground,
            width: Get.width - 80,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.02),
          ),
        ));
  }
}
