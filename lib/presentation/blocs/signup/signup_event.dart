import 'package:e_commercial/data/models/auth/signup_req.dart';
import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpSubmitted extends SignUpEvent {
  final SignUpReqParams params;

  SignUpSubmitted(this.params);

  @override
  List<Object?> get props => [params];
}