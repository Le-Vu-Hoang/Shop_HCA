import 'package:e_commercial/data/models/user/local_user_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {
  final ProfileLoaded previous;
  ProfileLoading(this.previous);
}


class ProfileLoaded extends ProfileState {
  final LocalUserModel user;
  ProfileLoaded(this.user);
}

class ProfileUpdating extends ProfileState {}

class ProfileUpdated extends ProfileState {}

class ProfileError extends ProfileState {
  final String errorMessage;
  ProfileError(this.errorMessage);
}

