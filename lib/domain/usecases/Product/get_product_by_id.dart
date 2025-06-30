import 'package:dartz/dartz.dart';
import 'package:e_commercial/domain/repositories/product_repository.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../core/errors/failure.dart';
import '../../../injection/injection_container.dart';
import '../../entities/product.dart';

class GetProductByIdUseCase implements UseCase<Either<Failure, ProductEntity>, String> {
  @override
  Future<Either<Failure, ProductEntity>> call({String? params}) async {
    return await sl<ProductRepository>().getProductById(params!);
  }

}