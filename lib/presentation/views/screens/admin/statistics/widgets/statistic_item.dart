import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/presentation/views/widgets/clickable.dart';

class StatisticItem extends StatelessWidget {
  const StatisticItem({super.key, required this.iconPath, required this.text, required this.stream});

  final String iconPath;
  final String text;
  final Stream<AggregateQuerySnapshot> stream;

  @override
  Widget build(BuildContext context) {
    return Clickable(
      radius: 12,
      child: Padding(
        padding: 8.padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconPath,
              width: 50,
              height: 50,
            ),
            12.spaceY,
            StreamBuilder<AggregateQuerySnapshot>(
              stream: stream,
              builder: (context, snapshot) {
                return Text('${snapshot.hasData ? snapshot.data!.count : 0 } ${text.tr}');
              }
            ),
          ],
        ),
      ),
    );
  }
}
