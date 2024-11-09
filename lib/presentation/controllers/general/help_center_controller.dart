import 'package:flutter/material.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class HelpCenterController extends MainController {
  final formKey = GlobalKey<FormState>();
  final tecTitle = TextEditingController();
  final tecTopic = TextEditingController();

  Future<void> sendIssue() async {
    if (formKey.currentState!.validate()) {
      
    }
  }
}