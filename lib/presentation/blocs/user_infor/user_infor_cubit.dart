import 'package:bloc/bloc.dart';
import 'package:e_commercial/domain/usecases/Auth/get_user_infor.dart';
import 'package:e_commercial/presentation/blocs/user_infor/user_infor_state.dart';

import '../../../injection/injection_container.dart';

class UserInforCubit extends Cubit<UserInforState> {
  UserInforCubit() : super(UserInforLoading());

  void displayUserInfor() async {
    var data = await sl<GetUserInforUseCase>().call();

    data.fold(
        (failure) => emit(LoadUserInforFailure(errorMessage: failure.message)),
        (data) => emit(UserInforLoaded(user: data)));
  }
}
