import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/domain/entities/category.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class QuestionsController extends MainController {
  double defaultTextSize = 14;
  bool textSizeControllability = false;
  late Stream<QuerySnapshot<Map<String, dynamic>>> questions;

  @override
  void onInit() {
    getQuestions(Category.fromJson(Get.arguments).id);
    super.onInit();
  }

  void getQuestions(String categoryId) {
    questions = firestore
        .collection(Constants().questionsCollection)
        .where('category_id', isEqualTo: categoryId)
        .orderBy('created_at', descending: true)
        .snapshots();
  }

  void chnageTextSize(size) {
    defaultTextSize = size;
    update();
  }

  void toggleTextSizeControllability() {
    textSizeControllability = !textSizeControllability;
    update();
  }
}
