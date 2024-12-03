import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class QuestionsController extends MainController {
  double defaultTextSize = 14;
  bool textSizeControllability = false;

  Stream<QuerySnapshot<Map<String, dynamic>>> getQuestions(String categoryId) =>
      firestore
          .collection(Constants().questionsCollection)
          .where('category_id', isEqualTo: categoryId)
          .orderBy('created_at', descending: true)
          .snapshots();

  void chnageTextSize(size){
    defaultTextSize = size;
    update();
  }  

  void toggleTextSizeControllability (){
    textSizeControllability = !textSizeControllability;
    update();
  }        
   
}
