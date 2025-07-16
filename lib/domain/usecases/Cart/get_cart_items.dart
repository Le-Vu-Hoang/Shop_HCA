import 'package:dartz/dartz.dart';
import 'package:e_commercial/domain/repositories/cart_repository.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../core/errors/failure.dart';
import '../../../injection/injection_container.dart';
import '../../entities/cart.dart';

class GetCartItemsUseCase implements UseCase <Either<Failure, List<CartEntity>>, dynamic> {
  @override
  Future<Either<Failure, List<CartEntity>>> call({params}) {
    return sl<CartRepository>().getCart();
  }

}