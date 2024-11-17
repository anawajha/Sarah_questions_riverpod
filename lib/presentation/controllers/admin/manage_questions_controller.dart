import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/utils/app_utils.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class ManageQuestionsController extends MainController {
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

  Stream<QuerySnapshot<Map<String, dynamic>>> getQuestions({String? catId}) =>
      catId != null
          ? firestore
              .collection(Constants().questionsCollection).where('category_id', isEqualTo: catId)
              .orderBy('created_at', descending: true)
              .snapshots()
          : firestore
              .collection(Constants().questionsCollection)
              .orderBy('created_at', descending: true)
              .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> getQuestionsById(String id) =>
      firestore
          .collection(Constants().questionsCollection)
          .where('category_id', isEqualTo: id)
          .orderBy('created_at', descending: true)
          .snapshots();

  Future<void> deleteCategory(String quesId) async {
    firestore
        .collection(Constants().questionsCollection)
        .doc(quesId)
        .delete()
        .then((o) => AppUtils()
            .snackError(body: TransManager.questionDeletedSuccessfully.tr))
        .catchError((e) => AppUtils()
            .snackError(body: TransManager.errorWhileDeletingQuestion.tr));
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
}
