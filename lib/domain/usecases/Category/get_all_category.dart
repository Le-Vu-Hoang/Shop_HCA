
import 'package:dartz/dartz.dart';
import 'package:e_commercial/core/errors/failure.dart';
import 'package:e_commercial/domain/entities/category.dart';
import 'package:e_commercial/domain/repositories/category_repository.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../injection/injection_container.dart';

class GetAllCategoryUseCase implements UseCase<Either<Failure, List<CategoryEntity>>, dynamic> {
  @override
  Future<Either<Failure, List<CategoryEntity>>> call({dynamic params}) async {
     return await sl<CategoryRepository>().getCategories();
  }

}