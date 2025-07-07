import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/usecases/usecasese.dart';
import 'button_state.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> excute({dynamic params, required UseCase useCase}) async {
    emit(ButtonLoadingState());
    try {
      Either result = await useCase.call(params: params);

      result.fold(
            (error) {
          emit(ButtonErrorState(
              message: error.toString()
          ));
        },
            (data) {
          emit(ButtonSuccessState());
        },
      );
    } catch (e) {
      emit(ButtonErrorState(
          message: e.toString(
      )));
    }
  }
}
