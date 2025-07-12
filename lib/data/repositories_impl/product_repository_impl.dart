import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:e_commercial/core/errors/failure.dart';
import 'package:e_commercial/core/network/service/product_api_service.dart';
import 'package:e_commercial/domain/entities/product.dart';
import 'package:e_commercial/domain/entities/product_detail.dart';
import 'package:e_commercial/domain/entities/product_variant.dart';
import 'package:e_commercial/domain/repositories/product_repository.dart';
import 'package:logger/logger.dart';

import '../../injection/injection_container.dart';

class ProductRepositoryImpl implements ProductRepository{
  @override
  Future<Either<Failure, ProductDetailEntity>> getProductById(String id) async {
    return await sl<ProductApiService>().getProductById(id);
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({int? page, int? limit}) async {
    return await sl<ProductApiService>().getAllProducts(page: page, limit: limit);
  }

  @override
  Future<Either<Failure, ProductVariantEntity>> getVariantById(String id)  async {
    return await sl<ProductApiService>().getVariantById(id);

  }

  @override
  Future<Either<Failure, List<ProductVariantEntity>>> getVariantsOfProduct(String id) async {
    return await sl<ProductApiService>().getVariantOfProduct(id);
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductWithFilter({categoryId}) async {
    return await sl<ProductApiService>().getAllProductsWithFilter(categoryId: categoryId);
  }
}