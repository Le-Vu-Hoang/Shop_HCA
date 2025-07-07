import 'package:e_commercial/data/datasources/local/hive_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../data/datasources/local/auth_local_storage.dart';
import '../data/datasources/local/auth_storage_service.dart';

Future<void> setupDatasource(GetIt sl) async {
  sl.registerLazySingleton(() => FlutterSecureStorage());


  // Registering local storage services
  sl.registerLazySingleton(() => AuthStorageService(sl<FlutterSecureStorage>()));
  sl.registerLazySingleton<AuthLocalStorage>(() => AuthLocalStorageImpl());

  // Registering Hive and HiveService
  sl.registerSingleton<HiveInterface>(Hive);
  await sl<HiveInterface>().initFlutter();
  sl.registerSingleton<HiveService>(HiveService());
  await sl<HiveService>().init();
}