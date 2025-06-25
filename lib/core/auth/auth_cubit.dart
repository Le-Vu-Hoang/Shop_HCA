
import 'package:bloc/bloc.dart';
import 'package:e_commercial/core/auth/auth_state.dart';
import 'package:logger/logger.dart';
import '../../injection/injection_container.dart';

class AuthStateCubit extends Cubit<AuthState> {
  AuthStateCubit() : super(AppInitialState());

  Logger logger = sl<Logger>();

  void appStarted() async {
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if(isLoggedIn) {
      logger.i("✅ Login succesful, emitting Authenticated");
      emit(Authenticated());
    } else {
      logger.i("❌ No user found, emitting UnAuthenticated");
      emit(Unauthenticated());
    }
  }
}