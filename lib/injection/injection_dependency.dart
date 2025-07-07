import 'package:e_commercial/routes/app_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:logger/logger.dart';

Future<void> setupDependency(GetIt sl) async {
  sl.registerLazySingleton(() => Logger());
  sl.registerSingleton<AppRouter>(AppRouter());
}