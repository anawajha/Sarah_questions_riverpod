import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/presentation/views/widgets/loading_shimmer/shimmer_content_item.dart';
import 'package:sarahah_questions/presentation/views/widgets/loading_shimmer/shimmer_loading.dart';

class QuestionShimmer extends StatelessWidget {
  const QuestionShimmer({super.key, required this.textSize});

  final double textSize;

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Container(
        padding: 12.padding,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: 16.radius,
            border: Border.all(width: 0.5, color: Colors.black)),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ShimmerContentItem(width: Get.width - 100, height: textSize),
            16.spaceY,
            Row(
              children: [
                12.spaceX,
                Expanded(
                    child: ShimmerContentItem(
                  width: Get.width / 4,
                  height: 40,
                )),
                12.spaceX,
                Expanded(
                    child: ShimmerContentItem(
                  width: Get.width / 4,
                  height: 40,
                )),
                12.spaceX,
                Expanded(
                    child: ShimmerContentItem(
                  width: Get.width / 4,
                  height: 40,
                )),
                12.spaceX,
              ],
            )
          ],
        ),
      ),
    );
  }
}
