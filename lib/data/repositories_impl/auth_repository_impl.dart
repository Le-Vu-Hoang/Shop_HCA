
import 'package:dartz/dartz.dart';

import 'package:e_commercial/core/errors/failure.dart';
import 'package:e_commercial/core/network/service/auth_api_service.dart';
import 'package:e_commercial/data/datasources/local/auth_local_storage.dart';
import 'package:e_commercial/data/models/auth/change_password_req.dart';
import 'package:e_commercial/data/models/auth/signin_req.dart';
import 'package:e_commercial/data/models/auth/signup_req.dart';
import 'package:e_commercial/data/models/user/user_model.dart';
import 'package:e_commercial/domain/entities/auth.dart';
import 'package:e_commercial/domain/entities/user.dart';

import '../../domain/repositories/auth_repository.dart';
import '../../injection/injection_container.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, AuthEntity>> signIn(SignInReqParams params) async {
    return await sl<AuthApiService>().signIn(params);
  }

  @override
  Future<Either<Failure, AuthEntity>> signUp(SignUpReqParams params) async {
    return await sl<AuthApiService>().signUp(params);
  }

  @override
  Future<bool> isLoggedIn() {
    return sl<AuthLocalStorage>().isLoggedIn();
  }

  @override
  Future<Either<Failure, UserEntity>> getUserInfo() async {
    return await sl<AuthApiService>().getUserInfor();
  }

  @override
  Future<Either<Failure, String>> changePassword(ChangePasswordReq params) async {
    return await sl<AuthApiService>().changePassword(params);
  }

  @override
  Future<Either<Failure, String>> updateUser(UserModel userModel) async {
    return await sl<AuthApiService>().updateUser(userModel);
  }

  @override
  Future<Either<Failure, String>> refreshToken() {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }
}