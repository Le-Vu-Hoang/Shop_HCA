
import 'package:dartz/dartz.dart';
import 'package:e_commercial/domain/entities/user.dart';
import 'package:e_commercial/domain/repositories/auth_repository.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../core/errors/failure.dart';
import '../../../injection/injection_container.dart';

class GetUserInforUseCase implements UseCase <Either<Failure, UserEntity>, dynamic> {
  @override
  Future<Either<Failure, UserEntity>> call({ dynamic params}) async {
    return await sl<AuthRepository>().getUserInfo();
  }

}