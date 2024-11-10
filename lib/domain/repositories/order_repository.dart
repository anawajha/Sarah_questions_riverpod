import 'package:dartz/dartz.dart';
import 'package:sarahah_questions/domain/entities/app_response.dart';
import 'package:sarahah_questions/domain/entities/order.dart' as order;

abstract class OrderRepository {
  Future<Either<AppResponse, order.Order>> acceptOrder({
    required int? orderId,
  });

  Future<Either<AppResponse, List<order.Order>>> getMyOrders();
}
