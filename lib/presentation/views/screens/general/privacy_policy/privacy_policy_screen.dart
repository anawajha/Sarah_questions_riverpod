import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TransManager.privacyPolicy.tr)),
      body: ListView(
        padding: 24.padding,
        children: [
          Text(TransManager.privacyPolicyContent.tr)
        ],
      ),
    );
  }
}