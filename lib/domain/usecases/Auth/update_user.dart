import 'package:dartz/dartz.dart';
import 'package:e_commercial/data/models/user/user_model.dart';
import 'package:e_commercial/domain/repositories/auth_repository.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../core/errors/failure.dart';
import '../../../injection/injection_container.dart';

class UpdateUserUseCase implements UseCase<Either<Failure, String>, UserModel> {
  @override
  Future<Either<Failure, String>> call({UserModel? params}) async {
    return await sl<AuthRepository>().updateUser(params!);
  }

}