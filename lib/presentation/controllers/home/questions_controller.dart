import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class QuestionsController extends MainController {
  Stream<QuerySnapshot<Map<String, dynamic>>> getQuestions(String categoryId) =>
      firestore
          .collection(Constants().questionsCollection)
          .where('category_id', isEqualTo: categoryId)
          .orderBy('created_at', descending: true)
          .snapshots();

   
}
