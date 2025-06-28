import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/local/auth_local_storage.dart';
import '../data/datasources/local/auth_storage_service.dart';

void setupDatasource(GetIt sl) {
  sl.registerLazySingleton(() => AuthStorageService(sl<FlutterSecureStorage>()));
  sl.registerLazySingleton<AuthLocalStorage>(() => AuthLocalStorageImpl());
}