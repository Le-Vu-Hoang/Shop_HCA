
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:e_commercial/data/models/auth/change_password_req.dart';

import '../../../core/errors/failure.dart';
import '../../../injection/injection_container.dart';
import '../../repositories/auth_repository.dart';
import '../usecasese.dart';

class ChangePasswordUseCase implements UseCase<Either<Failure, String>, ChangePasswordReq> {
  @override
  Future<Either<Failure, String>> call({ChangePasswordReq? params}) async {
    return await sl<AuthRepository>().changePassword(params!);
  }

}