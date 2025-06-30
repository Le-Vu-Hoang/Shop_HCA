import 'package:dartz/dartz.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../core/errors/failure.dart';
import '../../../data/models/order/order_create_req.dart';
import '../../../injection/injection_container.dart';
import '../../repositories/order_repository.dart';

class CreateOrderUseCase implements UseCase<Either<Failure, String>, OrderReqParams> {

  @override
  Future<Either<Failure, String>> call({OrderReqParams? params}) async {
    return await sl<OrderRepository>().createOrder(params!);
  }
}