import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart' as iconsax;
import 'package:sarahah_questions/app/extensions/num.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({
    super.key,
  });

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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              'This is Sample of Question that shown for the App Admin & The End User',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center),
              16.spaceY,
              Row(
                children: [
                  Expanded(child: IconButton(onPressed: (){}, icon: Icon(Iconsax.copy))),
                  Expanded(child: IconButton(onPressed: (){}, icon: Icon(iconsax.Iconsax.whatsapp))),
                  Expanded(child: IconButton(onPressed: (){}, icon: Icon(Icons.share_rounded)))
                ],
              )
        ],
      ),
    );
  }
}
