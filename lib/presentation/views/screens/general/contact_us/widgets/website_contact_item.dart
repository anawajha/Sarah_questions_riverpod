import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class WebsiteContactItem extends StatelessWidget {
  const WebsiteContactItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TransManager.website.tr,
              style: Theme.of(context).textTheme.labelLarge),
          10.spaceY,
          InkWell(
              borderRadius: 10.radius,
              onTap: () async {
                final Uri launchUri = Uri.parse(Constants().website);
                await launchUrl(launchUri);
              },
              child: Row(children: [
                12.spaceX,
                Icon(
                  Iconsax.global5,
                  color: Theme.of(context).primaryColor,
                ),
                12.spaceX,
                Expanded(
                    child: Text(Constants().websiteLabel,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign:
                            Directionality.of(context) == TextDirection.ltr
                                ? TextAlign.start
                                : TextAlign.end)),
                                12.spaceX,
          IconButton(
              onPressed: () async => await Clipboard.setData(
                          ClipboardData(text: Constants().website))
                      .then(
                    (value) => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(TransManager.copiedToClipboard.tr)),
                    ),
                  ),
              icon: Icon(Icons.file_copy_rounded,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withOpacity(0.4))),
              ])),
          
          16.spaceY,
          const Divider()
        ]);
  }
}
