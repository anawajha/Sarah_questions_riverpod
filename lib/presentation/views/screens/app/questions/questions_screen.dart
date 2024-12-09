import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/domain/entities/category.dart';
import 'package:sarahah_questions/domain/entities/question.dart';
import 'package:sarahah_questions/presentation/controllers/home/questions_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/app/questions/widgets/question_item.dart';
import 'package:sarahah_questions/presentation/views/screens/app/questions/widgets/question_shimmer.dart';
import 'package:sarahah_questions/presentation/views/screens/app/questions/widgets/text_size_controll_widget.dart';
import 'package:sarahah_questions/presentation/views/widgets/loading_shimmer/shimmer.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(Get.arguments != null
              ? Category.fromJson(Get.arguments).name
              : TransManager.questions.tr),
          actions: [
            GetBuilder<QuestionsController>(builder: (logic) {
              return IconButton(
                  onPressed: logic.toggleTextSizeControllability,
                  icon: Icon(Icons.text_fields_rounded));
            })
          ]),
      body: GetBuilder<QuestionsController>(builder: (logic) {
        return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: logic.questions,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Shimmer(
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: 20.padding,
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          QuestionShimmer(textSize: logic.defaultTextSize),
                      separatorBuilder: (context, index) => 12.spaceY,
                      itemCount: 5),
                );
                // return Center(child: CircularProgressIndicator.adaptive());
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return ListView(
                  shrinkWrap: true,
                  children: [
                    TextSizeControllWidget(),
                    ListView.separated(
                        padding: 20.padding,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => QuestionItem(
                            textSize: logic.defaultTextSize,
                            question: Question.fromSnapshot(
                                snapshot.data!.docs[index])),
                        separatorBuilder: (context, index) => 12.spaceY,
                        itemCount: snapshot.data!.docs.length),
                  ],
                );
              }
              return Center(
                child: Text(TransManager.thereIsNoOptionsFound.tr),
              );
            });
      }),
    );
  }
}
