import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/domain/entities/question.dart';
import 'package:sarahah_questions/presentation/controllers/admin/manage_questions_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/admin/manage_questions/widgets/admin_question_item.dart';

class ManageQuestionsScreen extends StatelessWidget {
  const ManageQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TransManager.questions.tr)),
      body: GetBuilder<ManageQuestionsController>(builder: (logic) {
        return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: logic.getQuestions(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator.adaptive());
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return ListView.separated(
                    padding: 20.padding,
                    itemBuilder: (context, index) => AdminQuestionItem(
                        question:
                            Question.fromSnapshot(snapshot.data!.docs[index])),
                    separatorBuilder: (context, index) => 12.spaceY,
                    itemCount: snapshot.data!.docs.length);
              }
              return Center(
                child: Text(TransManager.thereIsNoOptionsFound.tr),
              );
            });
      }),
      floatingActionButton:
          GetBuilder<ManageQuestionsController>(builder: (logic) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          child: FloatingActionButton.extended(
              isExtended: logic.isExtended,
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () => Get.toNamed(Routes.addNewQuestion),
              label: Text(TransManager.addNew.tr),
              icon: Icon(Icons.add)),
        );
      }),
    );
  }
}
