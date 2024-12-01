import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/domain/entities/category.dart';
import 'package:sarahah_questions/domain/entities/question.dart';
import 'package:sarahah_questions/presentation/controllers/home/questions_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/app/questions/widgets/question_item.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Category.fromJson(Get.arguments).name),),
      body: GetBuilder<QuestionsController>(builder: (logic) {
        return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: logic.getQuestions(Category.fromJson(Get.arguments).id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator.adaptive());
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return ListView.separated(
                    padding: 20.padding,
                    itemBuilder: (context, index) => QuestionItem(
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
    );
  }
}
