import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/home/questions_controller.dart';

class TextSizeControllWidget extends StatelessWidget {
  const TextSizeControllWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsController>(builder: (logic) {
      return AnimatedSwitcher(
        // height: logic.textSizeControllability ? null : 0,
        duration: Duration(milliseconds: 900),
        reverseDuration: Duration(milliseconds: 900),
        // curve: !logic.textSizeControllability
        //     ? Curves.linearToEaseOut
        //     : Curves.easeInToLinear,
        child: logic.textSizeControllability
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(TransManager.controllTextSize.tr),
                  12.spaceY,
                  Slider.adaptive(
                      value: logic.defaultTextSize.toDouble(),
                      onChanged: logic.chnageTextSize,
                      min: 12,
                      max: 20,
                      divisions: 8),
                  12.spaceY,
                  Divider()
                ],
              )
            : SizedBox(),
      );
    });
  }
}
