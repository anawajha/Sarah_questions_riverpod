import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sarahah_questions/app/config/svg_manager.dart';
import 'package:sarahah_questions/app/extensions/date_time.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/services/storage/local_storage.dart';
import 'package:sarahah_questions/app/utils/app_utils.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';
import 'package:sarahah_questions/data/providers/api/auth_api.dart';
import 'package:sarahah_questions/domain/entities/car_color.dart';
import 'package:sarahah_questions/domain/entities/car_model.dart';
import 'package:sarahah_questions/domain/entities/car_type.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/register/steps/register_step_five.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/register/steps/register_step_four.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/register/steps/register_step_one.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/register/steps/register_step_three.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/register/steps/register_step_two.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/register_result/register_result_screen.dart';
import '../../../domain/entities/register_user.dart';

class RegisterController extends MainController {
  final localService = MyGetUtils().findService(LocalStorageService());
  final stepOneFormKey = GlobalKey<FormState>();
  final stepTwoFormKey = GlobalKey<FormState>();
  final stepThreeFormKey = GlobalKey<FormState>();
  final stepFourFormKey = GlobalKey<FormState>();

  final tecFirstName = TextEditingController();
  final tecMiddleName = TextEditingController();
  final tecLastName = TextEditingController();
  final tecPhone = TextEditingController();
  final tecDob = TextEditingController();
  final tecGender = TextEditingController();
  final tecIdNumber = TextEditingController();
  final tecDrivingLicenseNumber = TextEditingController();
  final tecCarNumber = TextEditingController();
  final tecCarBrand = TextEditingController();
  final tecCarModel = TextEditingController();
  final tecCarColor = TextEditingController();
  final tecEmail = TextEditingController();
  final tecPassword = TextEditingController();

  File? profileImage;
  File? idImage;
  File? drivingLicenseImage;

  void pickProfileImage(File? file) {
    profileImage = file;
    update();
  }

  void pickIdImage(File? file) {
    idImage = file;
    update();
  }

  void pickDivingLicenseImage(File? file) {
    drivingLicenseImage = file;
    update();
  }

  bool loading = false;

  List<Widget> steps = const [
    RegisterStepOne(),
    RegisterStepTwo(),
    RegisterStepThree(),
    RegisterStepFour(),
    RegisterStepFive()
  ];

  void changeLoadingStatus({bool loading = false}) {
    this.loading = loading;
    update();
  }

  int selectedStepIndex = 0;
  void changeSelectedStep({int? index}) {
    selectedStepIndex = index ?? (selectedStepIndex + 1);
    update();
  }

  Future<void> createAccount() async {
    try {
      showProgress();
      final RegisterUser user = RegisterUser(
        fcmToken: localService.fcmToken,
        firstName: tecFirstName.text,
        midName: tecMiddleName.text,
        lastName: tecLastName.text,
        phone: tecPhone.text,
        image: profileImage,
        ssnImage: idImage,
        gender: tecGender.text,
        licenseImage: drivingLicenseImage,
        email: tecEmail.text,
        ssn: tecIdNumber.text,
        licenseNumber: tecDrivingLicenseNumber.text,
        carNumber: tecCarNumber.text,
        dateOfBirth: DateTime.fromMillisecondsSinceEpoch(_dob ?? 0),
        carColorId: '$selectedCarColor',
        carModelId: '$selectedCarModel',
        carTypeId: '$selectedCarType',
        password: tecPassword.text,
      );

      final res = await AuthAPI().register(registerUser: user);
      hideProgress();
      res.fold(
        (l) {
          AppUtils().snackError(body: l.message ?? '');
        },
        (r) {
          Get.offAll(
            () => RegisterResultScreen(
              iconPath: SvgManager().shieldSearch,
              label: TransManager.underReview.tr,
              topic: TransManager.accountUnderReviewHint.tr,
            ),
          );
        },
      );
    } catch (e) {
      hideProgress();
      Logger().e(e);
    }
  }

  int? _dob;
  final _now = DateTime.now();
  Future<void> pickDate({required BuildContext context}) async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate:
            _dob != null ? DateTime.fromMillisecondsSinceEpoch(_dob!) : _now,
        locale: Get.locale,
        firstDate: DateTime(_now.year - 150),
        lastDate: _now,
        initialEntryMode: DatePickerEntryMode.calendarOnly);
    if (date != null) {
      _dob = date.millisecondsSinceEpoch;
      tecDob.text = date.getDateFormatted();
    }
  }

  bool visiblePassword = true;

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    update();
    Future.delayed(const Duration(seconds: 4), (() {
      visiblePassword = true;
      update();
    }));
  }

  List<String> genders = [TransManager.male, TransManager.female];

  List<CarModel> carModels = [];
  List<CarColor> carColors = [];
  List<CarType> carTypes = [];

  int? selectedCarModel;
  int? selectedCarColor;
  int? selectedCarType;

  void changeSelectedCarModel({int? modelId}) {
    selectedCarModel = modelId;
    update();
  }

  void changeSelectedCarColor({int? colorId}) {
    selectedCarColor = colorId;
    update();
  }

  void changeSelectedCarType({int? typeId}) {
    selectedCarType = typeId;
    update();
  }

  Future<void> getCarModels() async {
    final res = await AuthAPI().getModels();
    res.fold(
      (l) {
        AppUtils().snackError(body: l.message ?? '');
      },
      (r) {
        carModels = r;
        update();
      },
    );
  }

  Future<void> getCarColors() async {
    final res = await AuthAPI().getColors();
    res.fold(
      (l) {
        AppUtils().snackError(body: l.message ?? '');
      },
      (r) {
        carColors = r;
        update();
      },
    );
  }

  Future<void> getCarTypes() async {
    final res = await AuthAPI().getTypes();
    res.fold(
      (l) {
        AppUtils().snackError(body: l.message ?? '');
      },
      (r) {
        carTypes = r;
        update();
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    if (localService.userData == null) {
      getCarColors();
      getCarModels();
      getCarTypes();
    }
  }

  void cleanRegisterForm() {
    selectedStepIndex = 0;
    tecFirstName.clear();
    tecMiddleName.clear();
    tecLastName.clear();
    tecPhone.clear();
    profileImage = null;
    idImage = null;
    tecGender.clear();
    drivingLicenseImage = null;
    tecEmail.clear();
    tecIdNumber.clear();
    tecDrivingLicenseNumber.clear();
    tecCarNumber.clear();
    tecDob.clear();
    selectedCarColor = null;
    selectedCarModel = null;
    selectedCarType = null;
    tecPassword.clear();
  }
}
