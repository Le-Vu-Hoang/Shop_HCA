import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entities/sub_category.dart';

abstract class SubCategoryRepository {
  Future<Either<Failure, List<SubCategoryEntity>>> getSubCategoriesByCategoryId(String id);
  Future<Either<Failure, SubCategoryEntity>> getSubCategoryById(String id);
}