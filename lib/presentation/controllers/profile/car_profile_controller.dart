import 'package:flutter/material.dart';
import 'package:sarahah_questions/domain/entities/car_color.dart';
import 'package:sarahah_questions/domain/entities/car_model.dart';
import 'package:sarahah_questions/domain/entities/car_type.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class CarProfileController extends MainController {

  final formKey = GlobalKey<FormState>();
  final tecCarNumber = TextEditingController();
  final tecCarBrand = TextEditingController();
  final tecCarModel = TextEditingController();
  final tecCarColor = TextEditingController();

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
}