import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commercial/core/network/config/dio_client.dart';
import 'package:e_commercial/core/utils/exception_handler.dart';
import 'package:e_commercial/data/models/product/product_model_mapper.dart';
import 'package:e_commercial/data/models/product_variant/product_variant_model_mapper.dart';
import 'package:e_commercial/domain/entities/product.dart';
import 'package:e_commercial/domain/entities/product_variant.dart';

import '../../../data/models/product/product_model.dart';
import '../../../data/models/product_variant/product_variant_model.dart';
import '../../../injection/injection_container.dart';
import '../../errors/failure.dart';
import '../config/api_path.dart';

abstract class ProductApiService {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts({int? page, int? limit});

  Future<Either<Failure, ProductEntity>> getProductById(String id);

  Future<Either<Failure, List<ProductVariantEntity>>> getVariantOfProduct(
      String id);

  Future<Either<Failure, ProductVariantEntity>> getVariantById(String id);
}

class ProductApiServiceImpl implements ProductApiService {
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts({int? page, int? limit}) async {
    try {
      var response = await sl<DioClient>().get(
        ApiPaths.product.getAllProducts,
        queryParameters: {
          if(page != null) 'page' : page,
          if(limit != null) 'limit': limit,
        }
      );
      List<ProductEntity> products = (response.data as List)
          .map((product) => ProductModel.fromJson(product).toEntity())
          .toList();
      return Right(products);
    } on DioException catch (e) {
      return Left(
        handleDioException(e,
            contextMessage: 'Failed to fetch all products from server.'),
      );
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(String id) async {
    try {
      var response = await sl<DioClient>().get(
          ApiPaths.product.getProductById(id));
      return Right(
        ProductModel.fromJson(response.data).toEntity(),
      );
    } on DioException catch (e) {
      return Left(
        handleDioException(e,
            contextMessage: 'Failed to fetch product with ${id} from server.'),
      );
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ProductVariantEntity>> getVariantById(
      String id) async {
    try {
      var response = await sl<DioClient>().get(
          ApiPaths.product.getVariantById(id));
      return Right(
        ProductVariantModel.fromJson(response.data).toEntity(),
      );
    } on DioException catch (e) {
      return Left(
        handleDioException(e,
            contextMessage: 'Failed to fetch variant with ${id} from server.'),
      );
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

    @override
    Future<Either<Failure, List<ProductVariantEntity>>> getVariantOfProduct(String id) async {
      try {
        var response = await sl<DioClient>().get(ApiPaths.product.getVariantOfProduct(id));
        List<ProductVariantEntity> variants = (response.data as List)
            .map((variant) => ProductVariantModel.fromJson(variant).toEntity())
            .toList();
        return Right(variants);
      } on DioException catch(e) {
        return Left(
          handleDioException(e,
              contextMessage: 'Failed to fetch variants for product $id.'),
        );
      } catch (e) {
        return Left(ServerFailure('Unexpected error: ${e.toString()}'));
      }
    }
  }
