import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commercial/core/errors/failure.dart';
import 'package:e_commercial/core/network/config/dio_client.dart';
import 'package:e_commercial/data/models/cart/cart_models/cart_model_mapper.dart';
import 'package:e_commercial/domain/entities/cart.dart';
import 'package:logger/logger.dart';

import '../../../data/models/cart/cart_models/cart_model.dart';
import '../../../data/models/cart/req_params/add_item_req_params.dart';
import '../../../injection/injection_container.dart';
import '../../utils/exception_handler.dart';
import '../config/api_path.dart';

abstract class CartApiService {
  Future<Either<Failure, String>> addToCart(AddCartReqParams params);

  Future<Either<Failure, List<CartModel>>> getCartItems();

  Future<void> updateCartItem(String productId, int quantity);

  Future<Either<Failure, String>> removeFromCart(String productId);
}

class CartApiServiceImpl implements CartApiService {
  @override
  Future<Either<Failure, String>> addToCart(AddCartReqParams params) async {
    sl<Logger>().d('🧾 JSON Body: ${params.toJson()}');
    try {
      var response = await sl<DioClient>().post(
        ApiPaths.cart.addToCart,
        data: params.toJson(),
      );
      return Right(response.data['message']);
    } on DioException catch (e) {
      return Left(
          handleDioException(e, contextMessage: 'Failed to add item to cart'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<CartModel>>> getCartItems() async {
    try {
      var response = await sl<DioClient>().get(ApiPaths.cart.getAllCart);
      List<CartModel> cartItems = (response.data as List)
          .map((item) => CartModel.fromJson(item))
          .toList();
      return Right(cartItems);
    } on DioException catch (e) {
      return Future.value(Left(
          handleDioException(e, contextMessage: 'Failed to fetch cart items')));
    } catch (e) {
      return Future.value(
          Left(ServerFailure('Unexpected error: ${e.toString()}')));
    }
  }

  @override
  Future<Either<Failure, String>> removeFromCart(String productId) {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }

  @override
  Future<void> updateCartItem(String productId, int quantity) {
    // TODO: implement updateCartItem
    throw UnimplementedError();
  }
}
