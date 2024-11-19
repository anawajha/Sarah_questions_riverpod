import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';
import 'package:sarahah_questions/domain/entities/question.dart';
import 'package:sarahah_questions/presentation/controllers/admin/manage_questions_controller.dart';
import 'package:sarahah_questions/presentation/views/widgets/app_pop_ip_menu_button.dart';

class AdminQuestionItem extends StatelessWidget {
  const AdminQuestionItem({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Container(
          padding: 12.padding,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: 16.radius,
              border: Border.all(
                  width: 0.5,
                  color: Theme.of(context).colorScheme.primaryContainer)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              double.infinity.spaceX,
              24.spaceY,
              Text(question.text,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.justify),
            ],
          ),
        ),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: AppPopupMenuButton(items: [
            // PopupMenuItem(
            //   child: Text(TransManager.edit.tr,
            //       style: Theme.of(context).textTheme.labelMedium),
            //   onTap: () => Get.toNamed(Routes.addNewQuestion,
            //       parameters: {"question_id": question.id}),
            // ),
            PopupMenuItem(
              child: Text(TransManager.delete.tr,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.error)),
              onTap: (){
                MyGetUtils().find<ManageQuestionsController>(ManageQuestionsController()).deleteQuestion(questionId: question.id);
              },
            )
          ]),
        ),
      ],
    );
  }
}
