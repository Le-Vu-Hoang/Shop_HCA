
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
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import '../../domain/repositories/auth_repository.dart';
import '../../injection/injection_container.dart';
import '../datasources/local/hive_service.dart';
import '../models/user/local_user_model.dart';

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
    final result = await sl<AuthApiService>().getUserInfor();

    await result.fold(
      (failure) async {
        sl<Logger>().e("Error: ${failure.message}");
      } ,
        (data) async {
          final LocalUserModel localUserModel = LocalUserModel.fromEntity(data);
          await sl<HiveService>().saveUser(localUserModel);
          sl<Logger>().i("User saved to Hive: ${localUserModel.accountName}");
        }
    );
    return result;
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