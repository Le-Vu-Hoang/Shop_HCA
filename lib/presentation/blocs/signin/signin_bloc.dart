import 'package:e_commercial/core/utils/validation.dart';
import 'package:e_commercial/domain/usecases/Auth/sign_in.dart';
import 'package:e_commercial/presentation/blocs/signin/signin_event.dart';
import 'package:e_commercial/presentation/blocs/signin/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection/injection_container.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInSubmitted>(_onSignInSubmitted);
  }

  Future<void> _onSignInSubmitted(SignInSubmitted event, Emitter<SignInState> emit) async {

    if(!Validation.isValidationEmail(event.params.email) || event.params.password.isEmpty){
      emit(SignInFailure("Invalid email"));
      return;
    }

    emit(SignInLoading());

    final result = await sl<SignInUseCase>().call(params: event.params);
    result.fold(
        (error) => emit(SignInFailure(error.message)),
        (_) => emit(SignInSuccess())
    );
  }
}