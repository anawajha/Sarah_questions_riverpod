import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/config/gif_manager.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/presentation/controllers/home/home_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/admin/statistics/widgets/statistic_item.dart';
import 'package:sarahah_questions/presentation/views/screens/app/home/widgets/app_drawer.dart';
import 'package:sarahah_questions/presentation/views/screens/app/home/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: GetBuilder<HomeController>(builder: (logic) {
        return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
          padding: 16.padding,
          children: [
            StatisticItem(
                onClick: () => Get.toNamed(Routes.questions),
                iconPath: GifManager().questions,
                text: TransManager.questions,
                stream: logic.questionsCount),
            StatisticItem(
                onClick: () => Get.toNamed(Routes.categories, arguments: null),
                iconPath: GifManager().categories,
                text: TransManager.categories,
                stream: logic.categoriesCount)
          ],
        );
      }),
      drawer: AppDrawer(),
    );
  }
}
