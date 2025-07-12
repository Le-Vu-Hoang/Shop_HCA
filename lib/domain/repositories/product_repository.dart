import 'package:dartz/dartz.dart';
import 'package:e_commercial/core/errors/failure.dart';
import 'package:e_commercial/domain/entities/product.dart';
import 'package:e_commercial/domain/entities/product_detail.dart';

import '../entities/product_variant.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts({int? page, int? limit});

  Future<Either<Failure, ProductDetailEntity>> getProductById(String id);

  Future<Either<Failure, List<ProductVariantEntity>>> getVariantsOfProduct(
      String id);

  Future<Either<Failure, ProductVariantEntity>> getVariantById(String id);

  Future<Either<Failure, List<ProductEntity>>> getProductWithFilter({String? categoryId});
}
