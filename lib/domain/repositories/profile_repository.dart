import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sarahah_questions/domain/entities/app_response.dart';
import 'package:sarahah_questions/domain/entities/user.dart';

abstract class ProfileRepository {
  Future<Either<AppResponse, User>> updateProfile({
    required String firstName,
    required String middleName,
    required String lastName,
    File? image,
    required String dob
  });
}
