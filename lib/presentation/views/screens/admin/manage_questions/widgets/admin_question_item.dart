import 'package:flutter/material.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/presentation/views/screens/admin/manage_questions/widgets/app_small_icon_button.dart';

class AdminQuestionItem extends StatelessWidget {
  const AdminQuestionItem({super.key});

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
          AppSmallIconButton(
            icon: Icons.more_vert,
            onTap: () {},
          ),
          8.spaceY,
          Text(
              'This is Sample of Question that shown for the App Admin & The End User',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
