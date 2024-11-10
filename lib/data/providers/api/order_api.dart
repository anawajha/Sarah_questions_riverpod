import 'package:dartz/dartz.dart';
import 'package:sarahah_questions/data/core/api_endpoint.dart';
import 'package:sarahah_questions/data/core/dio_manger.dart';
import 'package:sarahah_questions/data/enums/header_types.dart';
import 'package:sarahah_questions/domain/entities/app_response.dart';
import 'package:sarahah_questions/domain/entities/order.dart' as order;
import 'package:sarahah_questions/domain/repositories/order_repository.dart';

class OrderAPI extends OrderRepository {
  OrderAPI._();
  static final OrderAPI _orderAPI = OrderAPI._();
  factory OrderAPI() => _orderAPI;
  
  @override
  Future<Either<AppResponse, order.Order>> acceptOrder({required int? orderId}) async {
        final res = await DioManager.getInstance.postForm(
      url: acceptOrderEndPoint,
       header: HeaderTypes.basicWithAuthorization.header,
      body: {
        'order_id': orderId,
      });

     AppResponse appResponse = AppResponse.fromJson(res.data);
    if (appResponse.success == true) {
      return Right(order.Order.fromJson(appResponse.data));
    } else {
      return Left(appResponse);
    }
  }
  
  @override
  Future<Either<AppResponse, List<order.Order>>> getMyOrders() async {
      final res = await DioManager.getInstance.get(
      header: HeaderTypes.basicWithAuthorization.header,
      url: getOrdersEndpoint,
    );

    AppResponse appResponse = AppResponse.fromJson(res.data);
    if (appResponse.success == true) {
      List<order.Order> orders = [];
      appResponse.data.forEach((v) {
        orders.add(order.Order.fromJson(v));
      });
      return Right(orders);
    } else {
      return Left(appResponse);
    }
  }
}
