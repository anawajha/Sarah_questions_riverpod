import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/admin/add_new_category_controller.dart';
import 'package:sarahah_questions/presentation/views/widgets/labeled_text_form_field.dart';

class AddNewCategoryScreen extends StatelessWidget {
  const AddNewCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TransManager.addNewCategory.tr),
      ),
      body: GetBuilder<AddNewCategoryController>(
          builder: (logic) => Form(
            key: logic.formKey,
            child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 80.h),
                  children: [
                    LabeledTextField(
                        label: TransManager.questionText.tr,
                        controller: logic.tecCategoryName,
                        hint: TransManager.enterQuestionTextHere.tr,
                        prefixIcon: Icon(Iconsax.text5),
                        validator: (t) => t.toString().trim().isNotEmpty ? null : TransManager.youMustEnterCategoryName.tr),
                    80.spaceY,
                    ElevatedButton(
                        onPressed: ()=> logic.addNewQuestion, child: Text(TransManager.add.tr)),
                  ],
                ),
          )),
    );
  }
}