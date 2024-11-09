import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sarahah_questions/domain/entities/app_response.dart';
import 'package:sarahah_questions/domain/entities/order.dart' as order;

abstract class OrderRepository {
  Future<Either<AppResponse, order.Order>> acceptOrder({
    required int? orderId,
    required LatLng latLng
  });

  Future<Either<AppResponse, List<order.Order>>> getMyOrders();
}
