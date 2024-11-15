import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/services/storage/local_storage.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';
import 'package:sarahah_questions/presentation/views/widgets/progress_dialog.dart';

class MainController extends GetxController {
  final LocalStorageService lss = MyGetUtils().findService(LocalStorageService());
  bool isLoading = false;
  bool progressLoading = false;

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  void startLoading() {
    isLoading = true;
    update();
  }

  void stopLoading() {
    isLoading = false;
    update();
  }

  void showProgress() {
    progressLoading = true;
    Get.dialog(
      const ProgressDialog(),
      barrierDismissible: false
    );
    update();
  }

  void hideProgress() {
    progressLoading = false;
    Get.close(1);
    update();
  }
}
