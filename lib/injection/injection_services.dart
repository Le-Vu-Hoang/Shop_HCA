import 'package:e_commercial/core/network/config/dio_client.dart';
import 'package:e_commercial/core/network/service/address_api_service.dart';
import 'package:e_commercial/core/network/service/category_api_service.dart';
import 'package:e_commercial/core/network/service/order_api_service.dart';
import 'package:e_commercial/core/network/service/product_api_service.dart';
import 'package:e_commercial/core/network/service/sub_category_api_service.dart';
import 'package:get_it/get_it.dart';

import '../core/network/service/auth_api_service.dart';

void setupServices(GetIt sl) {
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerLazySingleton<AuthApiService>(() => AuthApiServiceImpl());
  sl.registerLazySingleton<CategoryApiService>(() => CategoryApiServiceImpl());
  sl.registerLazySingleton<ProductApiService>(() => ProductApiServiceImpl());
  sl.registerLazySingleton<SubCategoryApiService>(() => SubCategoryApiServiceImpl());
  sl.registerLazySingleton<OrderApiService>(() => OrderApiServiceImpl());
  sl.registerLazySingleton<AddressApiService>(() => AddressApiServiceImpl());
}