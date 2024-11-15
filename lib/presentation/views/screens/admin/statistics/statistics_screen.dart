import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/admin/statistics_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/admin/statistics/widgets/admin_drawer.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TransManager.statistics.tr)),
      drawer: AdminDrawer(),
      body: GetBuilder<StatisticsController>(builder: (logic) {
        return ListView();
      }),
    );
  }
}