import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

abstract class AuthRepository {
  // Future<void> signup(SignUpParams params);
  // Future<void> signin(SignInParams params);
  Future<bool> isLoggedIn();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, String>> refreshToken();
  // Future<Either<Failure, UserModel>> getUserInfo();
  Future<Either<Failure, void>> changePassword(String String);
  Future<Either<Failure,void>> forgotPassword(String);
  Future<Either<Failure, void>> signInWithGoogle(String);
  // Future<Either<Failure, void>> updateProfile(UserProfileParams params)
}
