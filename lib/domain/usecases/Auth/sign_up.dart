
import 'package:dartz/dartz.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../core/errors/failure.dart';
import '../../../data/models/auth/signup_req.dart';
import '../../../injection/injection_container.dart';
import '../../entities/auth.dart';
import '../../repositories/auth_repository.dart';

class SignUpUseCase implements UseCase <Either<Failure, AuthEntity>, SignUpReqParams> {

  @override
  Future<Either<Failure, AuthEntity>> call({SignUpReqParams? params}) async {
    return await sl<AuthRepository>().signUp(params!);
  }
}