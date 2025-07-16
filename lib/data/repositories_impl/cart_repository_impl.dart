import 'package:dartz/dartz.dart';

import 'package:e_commercial/core/errors/failure.dart';
import 'package:e_commercial/data/datasources/local/hive_service.dart';
import 'package:e_commercial/data/models/cart/cart_models/cart_model_mapper.dart';
import 'package:e_commercial/data/models/cart/local_cart_model/local_cart_model.dart';

import 'package:e_commercial/data/models/cart/req_params/add_item_req_params.dart';

import 'package:e_commercial/domain/entities/cart.dart';

import '../../core/network/service/cart_api_service.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../injection/injection_container.dart';
import '../models/cart/cart_models/cart_model.dart';

class CartRepositoryImpl implements CartRepository {
  @override
  Future<Either<Failure, String>> addToCart(AddCartReqParams params) {
    return sl<CartApiService>().addToCart(params);
  }

  @override
  Future<Either<Failure, List<CartEntity>>> getCart() async {
    final response = await sl<CartApiService>().getCartItems();
    return response.fold((failure) => Left(failure), (cartList) async {
      for (final cart in cartList) {
        await sl<HiveService>().saveCart(LocalCartModel.fromModel(cart));
      }
      final entityList = cartList.map((e) => e.toEntity()).toList();
      return Right(entityList);
    });
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
