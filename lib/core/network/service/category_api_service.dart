import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commercial/core/network/config/api_path.dart';
import 'package:e_commercial/core/network/config/dio_client.dart';
import 'package:e_commercial/core/utils/exception_handler.dart';
import 'package:e_commercial/data/models/category/category_model_mapper.dart';
import 'package:e_commercial/domain/entities/category.dart';

import '../../../data/models/category/category_model.dart';
import '../../../injection/injection_container.dart';
import '../../errors/failure.dart';

abstract class CategoryApiService {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
}

class CategoryApiServiceImpl implements CategoryApiService {
  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      var response = await sl<DioClient>().get(ApiPaths.category.getAllCategories);
      List <CategoryEntity> categories = (response.data as List)
          .map((category) => CategoryModel.fromJson(category).toEntity())
          .toList();
      return Right(categories);
    } on DioException catch(e){
      return Left(handleDioException(e , contextMessage: 'Failed to fetch categories'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}