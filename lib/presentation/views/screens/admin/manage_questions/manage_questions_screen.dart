import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/presentation/controllers/admin/manage_questions_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/admin/manage_questions/widgets/admin_question_item.dart';
import 'package:sarahah_questions/presentation/views/screens/app/home/widgets/app_drawer.dart';

class ManageQuestionsScreen extends StatelessWidget {
  const ManageQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TransManager.questions.tr)),
      drawer: AppDrawer(),
      body: GetBuilder<ManageQuestionsController>(builder: (logic) {
        return ListView.separated(
            itemCount: 15,
            itemBuilder: (context, index) => AdminQuestionItem(),
            separatorBuilder: (context, index) => 16.spaceY,
            controller: logic.scrollController,
            padding: 20.padding);
      }),
      floatingActionButton:
          GetBuilder<ManageQuestionsController>(builder: (logic) {
        return FloatingActionButton.extended(
            isExtended: logic.isExtended,
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: () => Get.toNamed(Routes.addNewQuestion),
            label: Text(TransManager.addNew.tr),
            icon: Icon(Icons.add));
      }),
    );
  }
}
