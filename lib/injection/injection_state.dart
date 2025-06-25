import 'package:get_it/get_it.dart';

void setupState(GetIt sl) {
  sl.registerLazySingleton<AuthStateCubit>(
    AuthStateCubit()..appStarted(),
  );
}