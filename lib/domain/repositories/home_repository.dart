import 'package:dartz/dartz.dart';
import 'package:sarahah_questions/domain/entities/app_response.dart';
import 'package:sarahah_questions/domain/entities/order.dart' as order;

abstract class HomeRepository {
  Future<Either<AppResponse, void>> logout();

  Future<Either<AppResponse, order.Order?>> getCurrentOrder();
}
