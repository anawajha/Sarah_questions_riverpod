import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/extensions/string.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class FormalContactItem extends StatelessWidget {
  const FormalContactItem({
    super.key,
    required this.label,
    required this.value, required this.icon,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          10.spaceY,
          InkWell(
              borderRadius: 10.radius,
              onTap: () async {
                final Uri launchUri = Uri(
                  scheme: value.isNumber ? 'tel' : 'mailto',
                  path: value,
                );
                await launchUrl(launchUri);
              },
              child: Row(children: [
                12.spaceX,
                Icon(icon, color: Theme.of(context).primaryColor,),
                12.spaceX,
                Expanded(
                    child: Text(value,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(fontSize: 15.sp),
                        textDirection: TextDirection.ltr,
                        textAlign:
                            Directionality.of(context) == TextDirection.ltr
                                ? TextAlign.start
                                : TextAlign.end)),
                12.spaceX,
                IconButton(
                    onPressed: () async =>
                        await Clipboard.setData(ClipboardData(text: value))
                            .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(TransManager.copiedToClipboard.tr)),
                        ),),
                    icon: Icon(Icons.file_copy_rounded,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.4)))
              ])),
          16.spaceY,
          const Divider()
        ]);
  }
}


