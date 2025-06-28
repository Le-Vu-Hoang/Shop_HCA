import 'package:get_it/get_it.dart';

import '../core/auth/auth_cubit.dart';

void setupState(GetIt sl) {
  sl.registerLazySingleton<AuthStateCubit>(
        () => AuthStateCubit()..appStarted(),
  );
}