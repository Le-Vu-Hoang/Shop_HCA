
import 'package:bloc/bloc.dart';
import 'package:e_commercial/presentation/blocs/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() {
    Future.delayed(Duration(seconds: 2), () {
        emit(Unauthenticated());
      }
    );
  }
}