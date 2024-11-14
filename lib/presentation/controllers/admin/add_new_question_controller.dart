import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/utils/app_utils.dart';
import 'package:sarahah_questions/domain/entities/category.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class AddNewQuestionController extends MainController {
  final firestore = FirebaseFirestore.instance;

  final formKey = GlobalKey<FormState>();
  final tecQuestion = TextEditingController();

  final tecCategory = TextEditingController();
  List<Category> categories = [];

  String? selectedCategory;

  @override
  void onInit() {
    _getCategories();
    super.onInit();
  }

  Future<void> _getCategories() async {
    startLoading();
    firestore.collection(Constants().questionsCollection).orderBy('created_at', descending: true).get().then((data){
      data.docs.forEach((cat) => categories.add( Category.fromSnapshot(cat)));
      stopLoading();
    }).catchError((e){
      AppUtils().snackError(body: TransManager.somethingWentWrong.tr);
      stopLoading();
    });
  }

  Future<void> addNewQuestion () async {
    if(formKey.currentState!.validate()){
    showProgress();
     await firestore.collection('Questions').add({
            'category_id': selectedCategory, 
            'question_text': tecQuestion.text.trim(), 
            'author_id': FirebaseAuth.instance.currentUser?.uid,
            'created_at' : FieldValue.serverTimestamp()
          })
          .then((value) {
            hideProgress();
            AppUtils().snackSuccess(body: '');
          })
          .catchError((error){
            AppUtils().snackError(body: error);
            hideProgress();
          });
    }
  }

  changeSelectedCategory(dynamic categoryId) {
    selectedCategory = categoryId;
    update();
  }
}
