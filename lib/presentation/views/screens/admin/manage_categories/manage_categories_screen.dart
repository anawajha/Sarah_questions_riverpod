import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/admin/manage_categories_controller.dart';

class ManageCategoriesScreen extends StatelessWidget {
  const ManageCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TransManager.manageCategories.tr)),
      body: GetBuilder<ManageCategoriesController>(
        builder: (logic) {
          return ListView();
        }
      ),
    );
  }
}