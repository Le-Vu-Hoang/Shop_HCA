import 'package:e_commercial/data/repositories_impl/address_repository_impl.dart';
import 'package:e_commercial/data/repositories_impl/auth_repository_impl.dart';
import 'package:e_commercial/data/repositories_impl/order_repository_impl.dart';
import 'package:e_commercial/data/repositories_impl/sub_category_repository_impl.dart';
import 'package:e_commercial/domain/repositories/address_repository.dart';
import 'package:e_commercial/domain/repositories/auth_repository.dart';
import 'package:e_commercial/domain/repositories/category_repository.dart';
import 'package:e_commercial/domain/repositories/order_repository.dart';
import 'package:e_commercial/domain/repositories/product_repository.dart';
import 'package:e_commercial/domain/repositories/sub_category_repository.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories_impl/category_repository_impl.dart';
import '../data/repositories_impl/product_repository_impl.dart';

void setupRepository(GetIt sl) {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl());
  sl.registerLazySingleton<SubCategoryRepository>(() => SubCategoryRepositoryImpl());
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl());
  sl.registerLazySingleton<OrderRepository>(() => OrderRepositoryImpl());
  sl.registerLazySingleton<AddressRepository>(() => AddressRepositoryImpl());
}