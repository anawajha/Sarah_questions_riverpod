
class User {
  int? id;
  String? username;
  String? firstName;
  String? midName;
  String? lastName;
  String? phone;
  String? email;
  String? dob;
  String? gender;
  String? ssn;
  String? licenseNumber;
  String? carNumber;
  int? carModelId;
  int? carColorId;
  int? carTypeId;
  double? lat;
  double? long;
  String? fcmToken;
  String? ssnImage;
  String? licenseImage;
  String? image;
  bool? status;
  bool? isAvailable;
  String? token;

  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.midName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.dob,
    required this.gender,
    required this.ssn,
    required this.licenseNumber,
    required this.carNumber,
    required this.carModelId,
    required this.carColorId,
    required this.carTypeId,
    required this.lat,
    required this.long,
    required this.fcmToken,
    required this.ssnImage,
    required this.licenseImage,
    required this.image,
    required this.status,
    required this.isAvailable,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        firstName: json["first_name"],
        midName: json["mid_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        dob: json["date_of_birth"],
        gender: json["gender"],
        ssn: json["ssn"],
        licenseNumber: json["license_number"],
        carNumber: json["car_number"],
        carModelId: json["car_model_id"],
        carColorId: json["car_color_id"],
        carTypeId: json["car_type_id"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        fcmToken: json["fcm_token"],
        ssnImage: json["ssn_image"],
        licenseImage: json["license_image"],
        image: json["image"],
        status: json["status"],
        isAvailable: json["is_available"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "first_name": firstName,
        "mid_name": midName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "date_of_birth": dob,
        "gender" : gender,
        "ssn": ssn,
        "license_number": licenseNumber,
        "car_number": carNumber,
        "car_model_id": carModelId,
        "car_color_id": carColorId,
        "car_type_id": carTypeId,
        "lat": lat,
        "long": long,
        "fcm_token": fcmToken,
        "ssn_image": ssnImage,
        "license_image": licenseImage,
        "image": image,
        "status" : status,
        "is_available" : isAvailable,
        "token": token,
      };

      String get name => '$firstName $lastName'; 
      String get fullName => '$firstName $midName $lastName'; 
}
