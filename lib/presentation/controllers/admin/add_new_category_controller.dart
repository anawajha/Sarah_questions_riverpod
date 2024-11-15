import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/utils/app_utils.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class AddNewCategoryController extends MainController {

  final formKey = GlobalKey<FormState>();
  final tecCategoryName = TextEditingController();

  Future<void> addNewCategory () async {
    if (formKey.currentState!.validate()) {
      
    showProgress();
     await firestore.collection(Constants().categoriesCollection).add({
            'name': tecCategoryName.text.trim(), 
            'author_id': FirebaseAuth.instance.currentUser?.uid,
            'created_at' : FieldValue.serverTimestamp()
          })
          .then((value) {
            hideProgress();
            Get.back();
            AppUtils().snackSuccess(body: TransManager.questionAddedSuccessfully.tr);
          })
          .catchError((error){
            AppUtils().snackError(body: error);
            hideProgress();
          });
  }
  }
}