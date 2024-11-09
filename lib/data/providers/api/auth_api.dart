import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:sarahah_questions/app/services/storage/local_storage.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';
import 'package:sarahah_questions/data/core/api_endpoint.dart';
import 'package:sarahah_questions/data/core/dio_manger.dart';
import 'package:sarahah_questions/data/enums/header_types.dart';
import 'package:sarahah_questions/domain/entities/app_response.dart';
import 'package:sarahah_questions/domain/entities/car_color.dart';
import 'package:sarahah_questions/domain/entities/car_model.dart';
import 'package:sarahah_questions/domain/entities/car_type.dart';
import 'package:sarahah_questions/domain/entities/register_user.dart';
import 'package:sarahah_questions/domain/entities/user.dart';
import 'package:sarahah_questions/domain/repositories/auth_repository.dart';

class AuthAPI extends AuthenticationRepository {
  AuthAPI._();
  static final AuthAPI _authAPI = AuthAPI._();
  factory AuthAPI() => _authAPI;

  @override
  Future<Either<AppResponse, User>> login({
    required String email,
    required String password,
  }) async {
    Logger().e( 'Player ID From Login ${MyGetUtils().findService(LocalStorageService()).fcmToken}');
    final res = await DioManager.getInstance.postForm(
      url: loginEndpoint,
      header: HeaderTypes.basic.header,
      body: {
        'email': email,
        'password': password,
        'fcm_token': MyGetUtils().findService(LocalStorageService()).fcmToken,
      },
    );

    AppResponse appResponse = AppResponse.fromJson(res.data);
    if (appResponse.success == true) {
      return Right(User.fromJson(appResponse.data));
    } else {
      return Left(appResponse);
    }
  }

  @override
  Future<Either<AppResponse, User>> register({
    required RegisterUser registerUser,
  }) async {
    final res = await DioManager.getInstance.postForm(
      url: registerEndpoint,
      body: registerUser.toJson(),
      header: HeaderTypes.basic.header,
    );
    Logger().e(res.data);
    AppResponse appResponse = AppResponse.fromJson(res.data);
    if (appResponse.success == true) {
      return Right(User.fromJson(appResponse.data));
    } else {
      return Left(appResponse);
    }
  }

  @override
  Future<Either<AppResponse, List<CarColor>>> getColors() async {
    final res = await DioManager.getInstance.get(
      url: getColorsEndpoint,
      header: HeaderTypes.basic.header,
    );

    AppResponse appResponse = AppResponse.fromJson(res.data);
    if (appResponse.success == true) {
      List<CarColor> carColors = [];
      appResponse.data.forEach((v) {
        carColors.add(CarColor.fromJson(v));
      });
      return Right(carColors);
    } else {
      return Left(appResponse);
    }
  }

  @override
  Future<Either<AppResponse, List<CarModel>>> getModels() async {
    final res = await DioManager.getInstance.get(
      url: getModelsEndpoint,
      header: HeaderTypes.basic.header,
    );

    AppResponse appResponse = AppResponse.fromJson(res.data);
    if (appResponse.success == true) {
      List<CarModel> carModels = [];
      appResponse.data.forEach((v) {
        carModels.add(CarModel.fromJson(v));
      });
      return Right(carModels);
    } else {
      return Left(appResponse);
    }
  }

  @override
  Future<Either<AppResponse, List<CarType>>> getTypes() async {
    final res = await DioManager.getInstance.get(
      url: getTypesEndpoint,
      header: HeaderTypes.basic.header,
    );

    AppResponse appResponse = AppResponse.fromJson(res.data);
    if (appResponse.success == true) {
      List<CarType> carTypes = [];
      appResponse.data.forEach((v) {
        carTypes.add(CarType.fromJson(v));
      });
      return Right(carTypes);
    } else {
      return Left(appResponse);
    }
  }
}
