import 'package:dartz/dartz.dart';
import 'package:e_commercial/domain/entities/product.dart';
import 'package:e_commercial/domain/repositories/product_repository.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../core/errors/failure.dart';
import '../../../data/models/product/get_product_params.dart';
import '../../../injection/injection_container.dart';

class GetAllProductUseCase implements UseCase<Either<Failure, List<ProductEntity>>, dynamic> {
  @override
  Future<Either<Failure, List<ProductEntity>>> call({dynamic params}) async {
    final getParams = params as GetProductsParams;
    return await sl<ProductRepository>().getProducts(page: getParams.page, limit: getParams.limit);
  }
}