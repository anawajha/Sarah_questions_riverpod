import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';


class ProgressDialog extends StatelessWidget {
  const ProgressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,       
          children: [
            const CircularProgressIndicator.adaptive(),
            const SizedBox(height:15),
            Text(TransManager.loading.tr, style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}