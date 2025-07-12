import 'package:e_commercial/presentation/blocs/product/product_bloc.dart';
import 'package:get_it/get_it.dart';

import '../core/auth/auth_cubit.dart';
import '../domain/usecases/SubCategory/get_by_category.dart';
import '../presentation/blocs/category/category_cubit.dart';
import '../presentation/blocs/sub_category/sub_category_cubit.dart';

Future<void> setupState(GetIt sl) async {
  sl.registerLazySingleton<AuthStateCubit>(
    () => AuthStateCubit()..appStarted(),
  );
  sl.registerLazySingleton<CategoryDisplayCubit>(
    () => CategoryDisplayCubit(),
  );
  sl.registerLazySingleton<ProductBloc>(() => ProductBloc());
  sl.registerFactoryParam<SubCategoryDisplayCubit, String, void>(
      (categoryId, _) => SubCategoryDisplayCubit(categoryId));
}
