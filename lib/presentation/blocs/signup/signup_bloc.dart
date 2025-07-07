import 'package:bloc/bloc.dart';
import 'package:e_commercial/core/utils/validation.dart';
import 'package:e_commercial/presentation/blocs/signup/signup_event.dart';
import 'package:e_commercial/presentation/blocs/signup/signup_state.dart';

import '../../../domain/usecases/Auth/sign_up.dart';
import '../../../injection/injection_container.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSubmitted>(_onSubmitSignUp);
  }

  Future<void> _onSubmitSignUp(
      SignUpSubmitted event, Emitter<SignUpState> emit) async {
    if (!Validation.isValidationEmail(event.params.email) ||
        event.params.password.isEmpty) {
      emit(SignUpFailure("Invalid email or password"));
      return;
    }

    if (!Validation.isValidationPassword(event.params.password)) {
      emit(SignUpFailure(
          "Password must be at least 8 characters long, contain uppercase and lowercase letters, numbers, and special characters."));
      return;
    }

    emit(SignUpLoading());

    final result = await sl<SignUpUseCase>().call(params: event.params);
    result.fold((error) => emit(SignUpFailure(error.message)),
        (_) => emit(SignUpSuccess()));
  }
}
