import 'package:e_commercial/core/auth/auth_cubit.dart';
import 'package:e_commercial/core/constants/app_themes.dart';
import 'package:e_commercial/core/utils/theme_controller.dart';
import 'package:e_commercial/presentation/blocs/category/category_cubit.dart';
import 'package:e_commercial/presentation/blocs/product/product_bloc.dart';
import 'package:e_commercial/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'injection/injection_container.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  await initDependencies();
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<AuthStateCubit>()),
          BlocProvider(create: (_) => sl<CategoryDisplayCubit>()),
          BlocProvider(create: (_) => sl<ProductBloc>()),
        ],
        child: MaterialApp.router(
          title: 'Fivana',
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          themeMode: themeController.theme,
          debugShowCheckedModeBanner: false,
          routerConfig: sl<AppRouter>().config(),
        ));
  }
}
