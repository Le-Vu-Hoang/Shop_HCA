import 'package:dartz/dartz.dart';
import 'package:e_commercial/core/errors/failure.dart';
import 'package:e_commercial/domain/entities/product.dart';

import '../entities/product_variant.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();

  Future<Either<Failure, ProductEntity>> getProductById(String id);

  Future<Either<Failure, List<ProductVariantEntity>>> getVariantsOfProduct(
      String id);

  Future<Either<Failure, ProductVariantEntity>> getVariantById(String id);
}
