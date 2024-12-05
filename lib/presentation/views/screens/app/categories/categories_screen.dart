import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/domain/entities/category.dart';
import 'package:sarahah_questions/presentation/controllers/home/home_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/app/categories/widgets/category_item.dart';
import 'package:sarahah_questions/presentation/views/screens/app/home/widgets/app_drawer.dart';
import 'package:sarahah_questions/presentation/views/screens/app/home/widgets/home_app_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: GetBuilder<HomeController>(builder: (logic) {
        return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: logic.getCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator.adaptive());
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return ListView.separated(
                    padding: 20.padding,
                    itemBuilder: (context, index) => CategoryItem(
                        category:
                            Category.fromSnapshot(snapshot.data!.docs[index])),
                    separatorBuilder: (context, index) => 12.spaceY,
                    itemCount: snapshot.data!.docs.length);
              }
              return Center(child: Text(TransManager.thereIsNoOptionsFound.tr));
            });
      }),
      drawer: AppDrawer(),
    );
  }
}
