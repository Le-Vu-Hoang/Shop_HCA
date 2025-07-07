import '../../../domain/entities/user.dart';

abstract class UserInforState{}

class UserInforLoading extends UserInforState{}

class UserInforLoaded extends UserInforState {
  final UserEntity user;

  UserInforLoaded({required this.user});
}

class LoadUserInforFailure extends UserInforState {
  final String errorMessage;

  LoadUserInforFailure({required this.errorMessage});
}