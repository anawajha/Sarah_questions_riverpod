import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:logger/logger.dart';
import 'package:sarahah_questions/data/core/api_endpoint.dart';
import 'package:sarahah_questions/data/core/dio_manger.dart';
import 'package:sarahah_questions/data/enums/header_types.dart';
import 'package:sarahah_questions/domain/entities/app_response.dart';
import 'package:sarahah_questions/domain/entities/user.dart';
import 'package:sarahah_questions/domain/repositories/profile_repository.dart';

class ProfileAPI extends ProfileRepository {
  ProfileAPI._();
  static final ProfileAPI _profileAPI = ProfileAPI._();
  factory ProfileAPI() => _profileAPI;

  @override
  Future<Either<AppResponse, User>> updateProfile({
    required String firstName,
    required String middleName,
    required String lastName,
    required dob,
    File? image
  }) async {
    final res = await DioManager.getInstance.postForm(
      url: updateProfileEndPoint,
      header: HeaderTypes.basicWithAuthorization.header,
      body: {
        'first_name': firstName,
        'mid_name': middleName,
        'last_name': lastName,
        'date_of_birth' : dob,
        if(image != null)...{
        'image': dio.MultipartFile.fromFileSync(image.path)
        }
      },
    );

    AppResponse appResponse = AppResponse.fromJson(res.data);
    Logger().d(appResponse.data);
    if (appResponse.success == true) {
      return Right(User.fromJson(appResponse.data));
    } else {
      return Left(appResponse);
    }
}
}
