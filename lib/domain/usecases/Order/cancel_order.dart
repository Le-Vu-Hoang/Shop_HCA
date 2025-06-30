import 'package:dartz/dartz.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../core/errors/failure.dart';
import '../../../data/models/order/order_create_req.dart';
import '../../../injection/injection_container.dart';
import '../../repositories/order_repository.dart';

class CancelOrderUseCase implements UseCase<Either<Failure, String>, String> {

  @override
  Future<Either<Failure, String>> call({String? params}) async {
    return await sl<OrderRepository>().cancelOrder(params!);
  }
}