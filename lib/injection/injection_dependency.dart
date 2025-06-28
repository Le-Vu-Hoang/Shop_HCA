import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:logger/logger.dart';

void setupDependency(GetIt sl) async {
  await Hive.initFlutter();

  sl.registerLazySingleton(() => Logger());
  sl.registerLazySingleton(() => FlutterSecureStorage());
  sl.registerLazySingleton<HiveInterface>(() => Hive);
}