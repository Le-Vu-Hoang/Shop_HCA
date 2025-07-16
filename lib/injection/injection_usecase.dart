import 'package:e_commercial/domain/usecases/Auth/is_logged_in.dart';
import 'package:e_commercial/domain/usecases/Cart/add_to_cart.dart';
import 'package:e_commercial/domain/usecases/Cart/get_cart_items.dart';
import 'package:get_it/get_it.dart';

import '../domain/usecases/Address/add_new_address.dart';
import '../domain/usecases/Address/get_all_address.dart';
import '../domain/usecases/Address/update_address.dart';
import '../domain/usecases/Auth/change_password.dart';
import '../domain/usecases/Auth/get_user_infor.dart';
import '../domain/usecases/Auth/sign_in.dart';
import '../domain/usecases/Auth/sign_up.dart';
import '../domain/usecases/Auth/update_user.dart';
import '../domain/usecases/Category/get_all_category.dart';
import '../domain/usecases/Order/cancel_order.dart';
import '../domain/usecases/Order/create_order.dart';
import '../domain/usecases/Order/get_all_order.dart';
import '../domain/usecases/Product/get_all_product.dart';
import '../domain/usecases/Product/get_all_product_by_filter.dart';
import '../domain/usecases/Product/get_product_by_id.dart';
import '../domain/usecases/Product/get_variant_by_id.dart';
import '../domain/usecases/Product/get_variant_of_product.dart';
import '../domain/usecases/SubCategory/get_by_category.dart';
import '../domain/usecases/SubCategory/get_by_id.dart';

Future<void> setupUseCases(GetIt sl) async {
  //             AUTH USE CASES
  sl.registerLazySingleton(() => IsLoggedInUseCase());
  sl.registerLazySingleton(() => SignInUseCase());
  sl.registerLazySingleton(() => SignUpUseCase());
  sl.registerLazySingleton(() => ChangePasswordUseCase());

  //             USER USE CASES
  sl.registerLazySingleton(() => UpdateUserUseCase());
  sl.registerLazySingleton(() => GetUserInforUseCase());

  //             CATEGORY USE CASES
  sl.registerLazySingleton(() => GetAllCategoryUseCase());

  //             SUBCATEGORY USE CASES
  sl.registerLazySingleton(() => SubGetAllByCateIdUSeCase());
  sl.registerLazySingleton(() => SubGetByIdUseCase());

  //             PRODUCT USE CASES
  sl.registerLazySingleton(() => GetAllProductUseCase());
  sl.registerLazySingleton(() => GetAllProductByFilter());
  sl.registerLazySingleton(() => GetProductByIdUseCase());

  //             PRODUCT_VARIANT USE CASES
  sl.registerLazySingleton(() => GetVariantByIdUseCase());
  sl.registerLazySingleton(() => GetVariantOfProductUseCase());

  //             ORDER USE CASES
  sl.registerLazySingleton(() => CancelOrderUseCase());
  sl.registerLazySingleton(() => CreateOrderUseCase());
  sl.registerLazySingleton(() => GetAllOrderUseCase());

  //             ADDRESS USE CASES
  sl.registerLazySingleton(() => AddNewAddressUseCase());
  sl.registerLazySingleton(() => GetAddressUseCase());
  sl.registerLazySingleton(() => UpdateAddressUseCase());

  //             CART USE CASES
  sl.registerLazySingleton(() => AddToCartUseCase());
  sl.registerLazySingleton(() => GetCartItemsUseCase());
}