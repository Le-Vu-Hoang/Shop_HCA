import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commercial/core/network/config/api_path.dart';
import 'package:e_commercial/core/network/config/dio_client.dart';
import 'package:e_commercial/core/utils/exception_handler.dart';
import 'package:e_commercial/data/models/order/order_create_req.dart';
import 'package:e_commercial/data/models/order/order_model_mapper.dart';

import '../../../data/models/order/order_model.dart';
import '../../../domain/entities/order.dart';
import '../../../injection/injection_container.dart';
import '../../errors/failure.dart';

abstract class OrderApiService {
  Future<Either<Failure, List<OrderEntity>>> getAllOrders();
  Future<Either<Failure, String>> createOrder(OrderReqParams order);
  Future<Either<Failure, String>> cancelOrder(String orderId);
}

class OrderApiServiceImpl implements OrderApiService {
  @override
  Future<Either<Failure, List<OrderEntity>>> getAllOrders() async {
    try {
      var response = await sl<DioClient>().get(ApiPaths.order.getAllOrders);
      List<OrderEntity> orders = (response.data as List)
          .map((orderItem) => OrderModel.fromJson(orderItem).toEntity())
          .toList();
      return Right(orders);
    } on DioException catch (e) {
      return Left(
          handleDioException(e, contextMessage: 'Failed to fetch orders'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> createOrder(OrderReqParams order) async {
    try {
      var response = await sl<DioClient>().post(
        ApiPaths.order.createOrder,
        data: order.toJson(),
      );
      return Right(response.data['message'] as String);
    } on DioException catch (e) {
      return Left(
          handleDioException(e, contextMessage: 'Failed to create order'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> cancelOrder(String orderId) async {
    try {
      var response =
          await sl<DioClient>().delete(ApiPaths.order.cancelOrder(orderId));
      return Right(response.data['message'] as String);
    } on DioException catch (e) {
      return Future.value(Left(
          handleDioException(e, contextMessage: 'Failed to cancel order')));
    } catch (e) {
      return Future.value(
          Left(ServerFailure('Unexpected error: ${e.toString()}')));
    }
  }
}
