import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/utils/app_utils.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class ManageCategoriesController extends MainController {

   late ScrollController scrollController;
  bool isExtended = true;

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  void _scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (isExtended) {
        isExtended = false;
        update();
      }
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!isExtended) {
        isExtended = true;
        update();
      }
    }
  }
  
  Stream<QuerySnapshot<Map<String, dynamic>>> getCategories() => firestore
      .collection(Constants().categoriesCollection)
      .orderBy('created_at', descending: true)
      .snapshots();

  Future<void> deleteCategory(String catId) async {
    firestore
        .collection(Constants().categoriesCollection)
        .doc(catId)
        .delete()
        .then((o) => AppUtils()
            .snackError(body: TransManager.categoryDeletedSuccessfully.tr))
        .catchError((e) => AppUtils()
            .snackError(body: TransManager.errorWhileDeletingCategory.tr));
  }
}
