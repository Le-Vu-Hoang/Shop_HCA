import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commercial/core/errors/failure.dart';
import 'package:e_commercial/core/network/config/api_path.dart';
import 'package:e_commercial/core/network/config/dio_client.dart';
import 'package:e_commercial/core/utils/exception_handler.dart';
import 'package:e_commercial/data/datasources/local/auth_storage_service.dart';
import 'package:e_commercial/data/models/auth/auth_model.dart';
import 'package:e_commercial/data/models/auth/auth_model_mapper.dart';
import 'package:e_commercial/data/models/auth/change_password_req.dart';
import 'package:e_commercial/data/models/auth/signin_req.dart';
import 'package:e_commercial/data/models/user/user_model.dart';
import 'package:e_commercial/data/models/user/user_model_mapper.dart';
import 'package:e_commercial/domain/entities/auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../data/models/auth/signup_req.dart';
import '../../../domain/entities/user.dart';
import '../../../injection/injection_container.dart';

abstract class AuthApiService {
  Future<Either<Failure, AuthEntity>> signIn(SignInReqParams params);

  Future<Either<Failure, AuthEntity>> signUp(SignUpReqParams params);

  Future<Either<Failure, UserEntity>> getUserInfor();

  Future<Either<Failure, String>> updateUser(UserModel userModel);

  Future<Either<Failure, String>> changePassword(ChangePasswordReq params);
// Future<Either<Failure, String>> refreshToken(String refreshToken);
}

class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<Either<Failure, AuthEntity>> signIn(SignInReqParams params) async {
    try {
      var response =
          await sl<DioClient>().post(ApiPaths.auth.login, data: params.toMap());
      AuthModel authModel = AuthModel.fromJson(response.data);
      await sl<AuthStorageService>().saveAuth(authModel);

      return Right(authModel.toEntity());
    } on DioException catch (e) {
      return Left(handleDioException(e, contextMessage: 'Login failed'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signUp(SignUpReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiPaths.auth.register,
        data: params.toMap(),
      );
      return Right(AuthModel.fromJson(response.data).toEntity());
    } on DioException catch (e) {
      return Left(handleDioException(e, contextMessage: 'Sign up failed'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> changePassword(
      ChangePasswordReq params) async {
    try {
      var response = await sl<DioClient>().put(
        ApiPaths.auth.changePassword,
        data: params.toMap(),
      );
      return Right(response.data['message'] as String);
    } on DioException catch (e) {
      return Left(
          handleDioException(e, contextMessage: 'Change password failed'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserInfor() async {
    try {
      var response = await sl<DioClient>().get(ApiPaths.auth.getUserInfor);
      return Right(UserModel.fromJson(response.data).toEntity());
    } on DioException catch (e) {
      return Left(
          handleDioException(e, contextMessage: 'Get user information failed'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> updateUser(UserModel userModel) async {
    try {
      var response = await sl<DioClient>().put(
        ApiPaths.auth.updateUser,
        data: userModel.toJson(),
      );
      return Right(response.data['message'] as String);
    } on DioException catch (e) {
      return Left(handleDioException(e, contextMessage: 'Update user failed'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
