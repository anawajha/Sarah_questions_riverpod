import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:sarahah_questions/data/core/api_endpoint.dart';
import 'package:sarahah_questions/data/core/dio_manger.dart';
import 'package:sarahah_questions/data/enums/header_types.dart';
import 'package:sarahah_questions/data/models/enum/order_status.dart';
import 'package:sarahah_questions/domain/entities/app_response.dart';
import 'package:sarahah_questions/domain/repositories/home_repository.dart';
import 'package:sarahah_questions/domain/entities/order.dart' as order;

class HomeAPI extends HomeRepository {
  HomeAPI._();
  static final HomeAPI _homeAPI = HomeAPI._();
  factory HomeAPI() => _homeAPI;

  @override
  Future<Either<AppResponse, void>> logout() async {
    final res = await DioManager.getInstance.postForm(
      url: logoutEndpoint,
      header: HeaderTypes.basicWithAuthorization.header);

    AppResponse appResponse = AppResponse.fromJson(res.data);
    if (appResponse.success == true) {
      // ignore: void_checks
      return const Right(());
    } else {
      return Left(appResponse);
    }
  }

  Future<Either<AppResponse, order.Order>> updateOrderStatus(int orderId, OrderStatus status) async {
    final res = await DioManager.getInstance.put(
      url: updateTripStatusEndPoint,
      body: {
        'order_id' : orderId,
        'status' : status.name,
      },
      header: HeaderTypes.acceptUrlencoded.header);

    AppResponse appResponse = AppResponse.fromJson(res.data);
    if (appResponse.success == true) {
      return Right(order.Order.fromJson(appResponse.data));
    } else {
      return Left(appResponse);
    }
  }

  @override
  Future<Either<AppResponse, order.Order?>> getCurrentOrder() async {
      final res = await DioManager.getInstance.get(
      header: HeaderTypes.basicWithAuthorization.header,
      url: getCurrentOrderEndPoint
    );

    AppResponse appResponse = AppResponse.fromJson(res.data);
    Logger().e(appResponse.data);
    if (appResponse.success == true) {
      if (appResponse.data != null) {
      return Right(order.Order.fromJson(appResponse.data));        
      }else {
      return const Right(null);        
      }
    } else {
      return Left(appResponse);
    }
  }
}
