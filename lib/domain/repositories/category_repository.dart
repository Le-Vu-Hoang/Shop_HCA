import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  // Future<Either<Failure, CategoryEntity>> getCategoryById(String id);
  // Future<Either<Failure, List<CategoryEntity>>> searchCategories(String query);
}