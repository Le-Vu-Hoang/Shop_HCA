import 'package:dartz/dartz.dart';
import 'package:e_commercial/core/errors/failure.dart';
import 'package:e_commercial/core/network/service/product_api_service.dart';
import 'package:e_commercial/domain/entities/product.dart';
import 'package:e_commercial/domain/entities/product_variant.dart';
import 'package:e_commercial/domain/repositories/product_repository.dart';

import '../../injection/injection_container.dart';

class ProductRepositoryImpl implements ProductRepository{
  @override
  Future<Either<Failure, ProductEntity>> getProductById(String id) async {
    return await sl<ProductApiService>().getProductById(id);
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    return await sl<ProductApiService>().getAllProducts();
  }

  @override
  Future<Either<Failure, ProductVariantEntity>> getVariantById(String id)  async {
    return await sl<ProductApiService>().getVariantById(id);

  }

  @override
  Future<Either<Failure, List<ProductVariantEntity>>> getVariantsOfProduct(String id) async {
    return await sl<ProductApiService>().getVariantOfProduct(id);
  }

}