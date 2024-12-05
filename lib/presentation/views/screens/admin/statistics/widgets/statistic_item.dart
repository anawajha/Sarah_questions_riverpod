import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/presentation/views/widgets/loading_shimmer/shimmer.dart';
import 'package:sarahah_questions/presentation/views/widgets/loading_shimmer/shimmer_content_item.dart';
import 'package:sarahah_questions/presentation/views/widgets/loading_shimmer/shimmer_loading.dart';

class StatisticItem extends StatelessWidget {
  const StatisticItem(
      {super.key,
      required this.iconPath,
      required this.text,
      required this.stream,
      required this.onClick});

  final String iconPath;
  final String text;
  final Stream<AggregateQuerySnapshot> stream;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      radius: 12,
      borderRadius: 12.radius,
      child: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: 12.radius,
            side:
                BorderSide(width: 0.5, color: Theme.of(context).primaryColor)),
        child: Padding(
          padding: 8.padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(iconPath, width: 60, height: 60),
              12.spaceY,
              StreamBuilder<AggregateQuerySnapshot>(
                  stream: stream,
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? Shimmer(
                            child: ShimmerLoading(
                                child: ShimmerContentItem(
                            width: Get.width / 4,
                            height: 10,
                            radius: 2,
                          )))
                        : Text(
                            '${snapshot.hasData ? snapshot.data!.count : 0} ${text.tr}',
                            style: Theme.of(context).textTheme.titleLarge,
                          );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
