import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/utils/app_utils.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class ManageCategoriesController extends MainController {
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
