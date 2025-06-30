
import 'package:dartz/dartz.dart';
import 'package:e_commercial/domain/entities/product_variant.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../core/errors/failure.dart';
import '../../../injection/injection_container.dart';
import '../../repositories/product_repository.dart';

class GetVariantByIdUseCase implements UseCase<Either<Failure, ProductVariantEntity>, String> {
  @override
  Future<Either<Failure, ProductVariantEntity>> call({String? params}) async {
    return await sl<ProductRepository>().getVariantById(params!);
  }

}