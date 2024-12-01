import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart' as iconsax;
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/domain/entities/question.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 12.padding,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: 16.radius,
          border: Border.all(
              width: 0.5,
              color: Theme.of(context).colorScheme.primaryContainer)),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(question.text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center),
          16.spaceY,
          Row(
            children: [
              Expanded(
                  child: IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: question.text));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(TransManager.copiedToClipboard.tr)),
                        );
                      },
                      icon: Icon(Iconsax.copy))),
              Expanded(
                  child: IconButton(
                      onPressed: () async {
                        if (await canLaunchUrl(Uri.parse(
                            Constants().whatsappUrl2 + question.text))) {
                          await launchUrl(Uri.parse(
                              Constants().whatsappUrl2 + question.text));
                        }
                      },
                      icon: Icon(iconsax.Iconsax.whatsapp))),
              Expanded(
                  child: IconButton(
                      onPressed: () async =>
                          await shareQuestion(context, question.text),
                      icon: Icon(Icons.share_rounded)))
            ],
          )
        ],
      ),
    );
  }

  Future<void> shareQuestion(BuildContext context, String text) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
      text,
      subject: text,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}
