import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/config/gif_manager.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/admin/statistics_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/admin/statistics/widgets/admin_drawer.dart';
import 'package:sarahah_questions/presentation/views/screens/admin/statistics/widgets/statistic_item.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TransManager.statistics.tr)),
      drawer: AdminDrawer(),
      body: GetBuilder<StatisticsController>(builder: (logic) {
        return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
          padding: 16.padding,
          children: [
            StatisticItem(
                iconPath: GifManager().questions,
                text: TransManager.questions,
                stream: logic.getQuestionsCount()),
            StatisticItem(
                iconPath: GifManager().questions,
                text: TransManager.categories,
                stream: logic.getCategoriesCount())
          ],
        );
      }),
    );
  }
}
