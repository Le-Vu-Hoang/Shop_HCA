import 'package:dartz/dartz.dart';

import 'package:e_commercial/core/errors/failure.dart';
import 'package:e_commercial/core/network/service/sub_category_api_service.dart';

import 'package:e_commercial/domain/entities/sub_category.dart';

import '../../domain/repositories/sub_category_repository.dart';
import '../../injection/injection_container.dart';

class SubCategoryRepositoryImpl implements SubCategoryRepository {
  @override
  Future<Either<Failure, List<SubCategoryEntity>>> getSubCategoriesByCategoryId(String id) async {
    return await sl<SubCategoryApiService>().getSubCategoriesByCategoryId(id);
  }

  @override
  Future<Either<Failure, SubCategoryEntity>> getSubCategoryById(String id)  async {
    return await sl<SubCategoryApiService>().getSubCategoryById(id);
  }
}