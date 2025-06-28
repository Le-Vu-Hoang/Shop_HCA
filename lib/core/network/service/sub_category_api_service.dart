import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commercial/core/errors/failure.dart';
import 'package:e_commercial/core/network/config/api_path.dart';
import 'package:e_commercial/data/models/sub_category/sub_category_model.dart';
import 'package:e_commercial/data/models/sub_category/sub_category_model_mapper.dart';
import '../../../domain/entities/sub_category.dart';
import '../../../injection/injection_container.dart';
import '../../utils/exception_handler.dart';
import '../config/dio_client.dart';

abstract class SubCategoryApiService {
  Future<Either<Failure, List<SubCategoryEntity>>> getSubCategoriesByCategoryId(String id);
  Future<Either<Failure, SubCategoryEntity>> getSubCategoryById(String id);
}

class SubCategoryApiServiceImpl implements SubCategoryApiService {
  @override
  Future<Either<Failure, List<SubCategoryEntity>>> getSubCategoriesByCategoryId(String id) async {
    try {
      var response = await sl<DioClient>().get(ApiPaths.subCategory.getAllSubCategories(id));
      List <SubCategoryEntity> subCategories = (response.data as List)
      .map((subCategory) => SubCategoryModel.fromJson(subCategory).toEntity())
      .toList();
      return Right(subCategories);
    } on DioException catch (e) {
      return Left(handleDioException(e, contextMessage: 'Failed to fetch subcategories'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, SubCategoryEntity>> getSubCategoryById(String id) async {
    try {
      var response = await sl<DioClient>().get(ApiPaths.subCategory.getSubCategoryById(id));
      SubCategoryEntity subCategory = SubCategoryModel.fromJson(response.data).toEntity();
      return Right(subCategory);
    } on DioException catch (e) {
      return Left(handleDioException(e, contextMessage: 'Failed to fetch subcategory'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}