import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sarahah_questions/data/models/enum/order_status.dart';
import 'package:sarahah_questions/domain/entities/app_response.dart';
import 'package:sarahah_questions/domain/entities/order.dart' as order;

abstract class HomeRepository {
  Future<Either<AppResponse, void>> logout();

  Future<Either<AppResponse, order.Order>> updateOrderStatus(int orderId, OrderStatus status, LatLng position);
  Future<Either<AppResponse, order.Order?>> getCurrentOrder();
}
