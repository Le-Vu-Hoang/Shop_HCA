
import 'package:dartz/dartz.dart';
import 'package:e_commercial/data/models/auth/signin_req.dart';
import 'package:e_commercial/domain/entities/auth.dart';
import 'package:e_commercial/domain/repositories/auth_repository.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../core/errors/failure.dart';
import '../../../injection/injection_container.dart';

class SignInUseCase implements UseCase<Either<Failure,AuthEntity>, SignInReqParams> {
  @override
  Future<Either<Failure, AuthEntity>> call({SignInReqParams? params}) async {
    return await sl<AuthRepository>().signIn(params!);
  }
}