
import 'package:dartz/dartz.dart';
import 'package:e_commercial/domain/repositories/product_repository.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../core/errors/failure.dart';
import '../../../injection/injection_container.dart';
import '../../entities/product_variant.dart';

class GetVariantOfProductUseCase implements UseCase<Either<Failure, List<ProductVariantEntity>>, String> {

  @override
  Future<Either<Failure, List<ProductVariantEntity>>> call({String? params}) async {
    return await sl<ProductRepository>().getVariantsOfProduct(params!);
  }
}