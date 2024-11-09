import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/config/svg_manager.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/extensions/string.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/general/help_center_controller.dart';
import 'package:sarahah_questions/presentation/views/widgets/image_svg.dart';
import 'package:sarahah_questions/presentation/views/widgets/labeled_text_form_field.dart';
import 'package:sarahah_questions/presentation/views/widgets/secondary_app_bar.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: TransManager.helpAndSupportCenter.tr),
      body: SafeArea(
        child: GetBuilder<HelpCenterController>(
            builder: (logic) {
              return Form(
                key: logic.formKey,
                child: ListView(
                  padding: EdgeInsets.only(
                      top: 40.h, bottom: 24.h, left: 28.w, right: 28.w),
                  children: [
                    ImageSvg(SvgManager().logo,
                        height: 60.h, color: Theme.of(context).primaryColor),
                    40.spaceY,
                    Text(TransManager.howCanWeHelpYou.tr,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 15.sp,
                            color: Theme.of(context).primaryColor),
                        textAlign: TextAlign.center),
                    Text(
                        TransManager
                            .weAreHereAllTheTimeToMeetYourWishesAndSolveYourProblems
                            .tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 15.sp),
                        textAlign: TextAlign.center),
                    32.spaceY,
                    const Divider(),
                    20.spaceY,
                    LabeledTextField(
                      controller: logic.tecTitle,
                      label: TransManager.topicTitle.tr,
                      hint: TransManager.topicTitle.tr,
                      prefixIcon: const Icon(Iconsax.document_text),
                      inputAction: TextInputAction.next,
                      validator: (txt) => txt.value.isNotEmpty ? null : TransManager.topicTitleIsRequired.tr
                    ),
                    20.spaceY,
                    LabeledTextField(
                        controller: logic.tecTopic,
                        label: TransManager.topic.tr,
                        hint: TransManager.writeTopicHere.tr,
                        prefixIcon: const Icon(Iconsax.document_text),
                        maxLines: 8,
                        inputType: TextInputType.multiline,
                        validator: (txt) => txt.value.isNotEmpty ? null : TransManager.topicIsRequired.tr),
                    32.spaceY,
                    ElevatedButton(
                        onPressed: () => logic.sendIssue(),
                        child: Text(TransManager.send.tr))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
