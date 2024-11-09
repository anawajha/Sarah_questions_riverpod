import 'dart:io';
import 'package:dio/dio.dart' as dio;

class RegisterUser {
  File? image;
  File? ssnImage;
  File? licenseImage;
  String? username;
  String? firstName;
  String? midName;
  String? lastName;
  String? phone;
  String? email;
  String? ssn;
  DateTime? dateOfBirth;
  String? licenseNumber;
  String? carNumber;
  String? carTypeId;
  String? carColorId;
  String? carModelId;
  String? fcmToken;
  int? id;
  String? token;
  String? gender;
  String? password;

  RegisterUser({
    required this.image,
    required this.ssnImage,
    required this.licenseImage,
    this.username,
    required this.firstName,
    required this.midName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.ssn,
    required this.dateOfBirth,
    required this.licenseNumber,
    required this.carNumber,
    required this.carTypeId,
    required this.carColorId,
    required this.carModelId,
    required this.fcmToken,
    required this.gender,
    required this.password,
    this.id,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
        id: json["id"],
        image: json["image"],
        ssnImage: json["ssn_image"],
        licenseImage: json["license_image"],
        username: json["username"],
        firstName: json["first_name"],
        midName: json["mid_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        ssn: json["ssn"],
        gender: json['gender'],
        dateOfBirth: json["date_of_birth"],
        licenseNumber: json["license_number"],
        carNumber: json["car_number"],
        carTypeId: json["car_type_id"],
        carColorId: json["car_color_id"],
        carModelId: json["car_model_id"],
        fcmToken: json["fcm_token"],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": dio.MultipartFile.fromFileSync(image?.path ?? ''),
        "ssn_image": dio.MultipartFile.fromFileSync(ssnImage?.path ?? ''),
        "license_image": dio.MultipartFile.fromFileSync(licenseImage?.path ?? ''),
        "username": username,
        "first_name": firstName,
        "mid_name": midName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "ssn": ssn,
        "date_of_birth": dateOfBirth,
        "license_number": licenseNumber,
        "car_number": carNumber,
        "car_type_id": carTypeId,
        "car_color_id": carColorId,
        "car_model_id": carModelId,
        "fcm_token": fcmToken,
        'gender' : gender,
        'password' : password,
        "token": token,
      };
}
