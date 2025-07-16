import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../../data/models/cart/req_params/add_item_req_params.dart';
import '../entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, String>> addToCart(AddCartReqParams params);

  Future<Either<Failure, List<CartEntity>>> getCart();

  Future<void> updateCartItem(String productId, int quantity);

  Future<Either<Failure, String>> removeFromCart(String productId);
}
