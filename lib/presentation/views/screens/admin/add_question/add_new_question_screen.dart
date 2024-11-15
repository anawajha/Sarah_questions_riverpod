import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/admin/add_new_question_controller.dart';
import 'package:sarahah_questions/presentation/views/widgets/dropdown_labeled_text_field.dart';
import 'package:sarahah_questions/presentation/views/widgets/labeled_text_form_field.dart';

class AddNewQuestionScreen extends StatelessWidget {
  const AddNewQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TransManager.addNew.tr),
      ),
      body: GetBuilder<AddNewQuestionController>(
          builder: (logic) => Form(
                key: logic.formKey,
                child: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 80.h),
                  children: [
                    LabeledTextField(
                        label: TransManager.questionText.tr,
                        controller: logic.tecQuestion,
                        hint: TransManager.enterQuestionTextHere.tr,
                        prefixIcon: Icon(Iconsax.text5),
                        validator: (p0) => p0.toString().trim().isNotEmpty ? null : TransManager.youMustEnterTheQuestion.tr,),
                    16.spaceY,
                    DropDownLabeledTextField(
                      controller: logic.tecCategory,
                      label: TransManager.selectCategory.tr,
                      onSelect: logic.changeSelectedCategory,
                      initialSelection: logic.selectedCategory,
                      errorText: TransManager.youMustSelectCategory.tr,
                      items: List.generate(
                        logic.categories.length,
                        (index) => DropdownMenuEntry(
                            value: logic.categories[index].id, label: logic.categories[index].name),
                      ),
                      width: Get.width - 40,
                    ),
                    80.spaceY,
                    ElevatedButton(
                        onPressed: () async => await logic.addNewQuestion(),
                        child: Text(TransManager.add.tr)),
                  ],
                ),
              )),
    );
  }
}
