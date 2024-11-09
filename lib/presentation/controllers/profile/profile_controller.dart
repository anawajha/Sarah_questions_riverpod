import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sarahah_questions/app/extensions/date_time.dart';
import 'package:sarahah_questions/app/services/storage/local_storage.dart';
import 'package:sarahah_questions/app/utils/app_utils.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';
import 'package:sarahah_questions/data/providers/api/profile_api.dart';
import 'package:sarahah_questions/domain/entities/user.dart';
import 'package:sarahah_questions/presentation/controllers/home/home_controller.dart';
import 'package:sarahah_questions/presentation/controllers/home/home_placeholder_controller.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class ProfileController extends MainController {
  static User? userData = MyGetUtils().findService(LocalStorageService()).userData;
  final formKey = GlobalKey<FormState>();
  final tecFirstName = TextEditingController();
  final tecMiddleName = TextEditingController();
  final tecLastName = TextEditingController();
  final tecDob = TextEditingController();

  File? image;

  void pickImage(File? file) {
    image = file;
    update();
  }

  @override
  void onInit() {
    userData =  MyGetUtils().findService(LocalStorageService()).userData;
    _refreshProfileData();
    super.onInit();
  }

  int? _dob;
  final _now = DateTime.now();
  Future<void> pickDate({required BuildContext context}) async {
    await showDatePicker(
            context: context,
            initialDate: _dob != null
                ? DateTime.fromMillisecondsSinceEpoch(_dob!)
                : _now,
            locale: Get.locale,
            firstDate: DateTime(_now.year - 80, _now.month, _now.day),
            lastDate: _now)
        .then((date) {
      if (date != null) {
        _dob = date.millisecondsSinceEpoch;
        tecDob.text = date.getDateFormatted();
        update();
      }
      Logger().e(date);
    });
  }

  Future<void> updateProfile() async {
    Logger().e(userData?.dob);
    if (formKey.currentState!.validate()) {
      showProgress();
      await ProfileAPI()
          .updateProfile(
              firstName: tecFirstName.text.trim(),
              middleName: tecMiddleName.text.trim(),
              lastName: tecLastName.text.trim(),
              dob: DateTime.fromMillisecondsSinceEpoch(_dob ?? 0)
                  .getDateFormatted(format: 'yyyy/MM/dd', langCode: 'en'),
              image: image)
          .then((response) {
        hideProgress();
        response.fold((l) {
          AppUtils().snackError(body: l.message ?? '');
        }, (r) {
          userData = r;
          MyGetUtils().findService(LocalStorageService()).userData = r;
          _refreshProfileData();
          Get.back();
          HomePlaceholderController.to.update();
          HomeController.to.update();
        });
      });
    }
  }

  void _refreshProfileData() {
    Logger().f(userData?.dob);
    tecFirstName.text = userData?.firstName ?? '';
    tecMiddleName.text = userData?.midName ?? '';
    tecLastName.text = userData?.lastName ?? '';
    _dob = DateTime.tryParse(userData?.dob ?? '')?.millisecondsSinceEpoch;
    tecDob.text = DateTime.tryParse(userData?.dob ?? '').getDateFormatted();
    update();
  }
}
