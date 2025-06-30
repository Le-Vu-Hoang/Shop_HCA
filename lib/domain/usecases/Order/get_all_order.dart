
import 'package:dartz/dartz.dart';
import 'package:e_commercial/domain/repositories/order_repository.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../core/errors/failure.dart';
import '../../../injection/injection_container.dart';
import '../../entities/order.dart';

class GetAllOrderUseCase implements UseCase<Either<Failure, List<OrderEntity>>, dynamic> {
  @override
  Future<Either<Failure, List<OrderEntity>>> call({dynamic params}) async {
    return await sl<OrderRepository>().getAllOrders();
  }

}