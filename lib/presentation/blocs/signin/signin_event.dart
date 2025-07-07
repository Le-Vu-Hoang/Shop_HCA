import 'package:e_commercial/data/models/auth/signin_req.dart';
import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInSubmitted extends SignInEvent {
  final SignInReqParams params;

  SignInSubmitted(this.params);

  @override
  List<Object> get props => [params];
}