import 'package:dartz/dartz.dart';
import 'package:e_commercial/core/errors/failure.dart';

import '../../data/models/order/order_create_req.dart';
import '../entities/order.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderEntity>>> getAllOrders();
  Future<Either<Failure, String>> createOrder(OrderReqParams order);
  Future<Either<Failure, String>> cancelOrder(String orderId);
}