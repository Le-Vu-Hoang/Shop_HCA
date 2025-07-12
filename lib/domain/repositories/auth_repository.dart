import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commercial/data/models/auth/change_password_req.dart';
import 'package:e_commercial/domain/entities/auth.dart';
import '../../core/errors/failure.dart';
import '../../data/models/auth/signin_req.dart';
import '../../data/models/auth/signup_req.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure,AuthEntity>> signUp(SignUpReqParams params);
  Future<Either<Failure,AuthEntity>> signIn(SignInReqParams params);
  Future<bool> isLoggedIn();
  Future<Either<Failure, UserEntity>> getUserInfo();
  Future<Either<Failure, String>> changePassword(ChangePasswordReq params);
  Future<Either<Failure, String>> updateUser(FormData formData);
  Future<Either<Failure, String>> refreshToken();
  // Future<Either<Failure,void>> forgotPassword(String);
  // Future<Either<Failure, void>> signInWithGoogle(String);
  // Future<Either<Failure, String>> logout();
}
