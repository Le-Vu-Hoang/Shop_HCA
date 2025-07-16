import 'package:dartz/dartz.dart';
import 'package:e_commercial/data/models/cart/req_params/add_item_req_params.dart';
import 'package:e_commercial/domain/repositories/cart_repository.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../core/errors/failure.dart';
import '../../../injection/injection_container.dart';

class AddToCartUseCase implements UseCase<Either<Failure, String>, dynamic> {
  @override
  Future<Either<Failure, String>> call({dynamic params}) async {
    final addItemParams = params as AddCartReqParams;
    return sl<CartRepository>().addToCart(addItemParams);
  }
}