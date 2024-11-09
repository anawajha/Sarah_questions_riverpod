import 'package:dartz/dartz.dart';
import 'package:sarahah_questions/domain/entities/app_response.dart';
import 'package:sarahah_questions/domain/entities/car_color.dart';
import 'package:sarahah_questions/domain/entities/car_model.dart';
import 'package:sarahah_questions/domain/entities/car_type.dart';
import 'package:sarahah_questions/domain/entities/user.dart';

import '../entities/register_user.dart';

abstract class AuthenticationRepository {
  Future<Either<AppResponse, User>> login({
    required String email,
    required String password,
  });

  Future<Either<AppResponse, User>> register({
    required RegisterUser registerUser,
  });


  Future<Either<AppResponse, List<CarColor>>> getColors();
  Future<Either<AppResponse, List<CarModel>>> getModels();
  Future<Either<AppResponse, List<CarType>>> getTypes();

}
