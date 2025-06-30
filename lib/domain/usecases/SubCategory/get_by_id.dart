import 'package:dartz/dartz.dart';
import 'package:e_commercial/domain/repositories/sub_category_repository.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../core/errors/failure.dart';
import '../../../injection/injection_container.dart';
import '../../entities/sub_category.dart';

class SubGetByIdUseCase
    implements UseCase<Either<Failure, SubCategoryEntity>, String> {
  @override
  Future<Either<Failure, SubCategoryEntity>> call({String? params}) async {
    return await sl<SubCategoryRepository>().getSubCategoryById(params!);
  }
}
