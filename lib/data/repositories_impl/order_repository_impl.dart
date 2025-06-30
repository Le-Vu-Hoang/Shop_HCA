import 'package:dartz/dartz.dart';

import 'package:e_commercial/core/errors/failure.dart';
import 'package:e_commercial/core/network/service/order_api_service.dart';

import 'package:e_commercial/data/models/order/order_create_req.dart';

import 'package:e_commercial/domain/entities/order.dart';

import '../../domain/repositories/order_repository.dart';
import '../../injection/injection_container.dart';

class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<Either<Failure, String>> cancelOrder(String orderId) async {
    return await sl<OrderApiService>().cancelOrder(orderId);
  }

  @override
  Future<Either<Failure, String>> createOrder(OrderReqParams order) async {
    return await sl<OrderApiService>().createOrder(order);
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getAllOrders() async {
    return await sl<OrderApiService>().getAllOrders();
  }

}