import 'package:auto_route/auto_route.dart';
import 'package:e_commercial/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    AutoRoute(page: MainRoute.page),
    AutoRoute(page: AllCategoriesRoute.page),
    AutoRoute(page: ProductRoute.page),
    AutoRoute(page: ProductDetailRoute.page),
  ];

}