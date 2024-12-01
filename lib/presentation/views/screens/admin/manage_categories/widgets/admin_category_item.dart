import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/domain/entities/category.dart';

class AdminCategoryItem extends StatelessWidget {
  const AdminCategoryItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Material(
          clipBehavior: Clip.antiAlias,
          elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: 8.radius,
          side: BorderSide(width: 0.5, color: Theme.of(context).colorScheme.secondary)
        ),
        child: InkWell(
          onTap: () => Get.toNamed(Routes.manageQuestions, arguments: category.toJson()),
          child: Padding(padding: 12.padding, child: Text(
                category.name,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center),),
        ),
      );
  }
}