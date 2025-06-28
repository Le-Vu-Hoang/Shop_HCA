import 'package:dartz/dartz.dart';

import 'package:e_commercial/core/errors/failure.dart';
import 'package:e_commercial/core/network/service/category_api_service.dart';

import 'package:e_commercial/domain/entities/category.dart';

import '../../domain/repositories/category_repository.dart';
import '../../injection/injection_container.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    return await sl<CategoryApiService>().getAllCategories();
  }

}