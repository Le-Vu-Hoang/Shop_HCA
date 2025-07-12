// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:e_commercial/presentation/pages/all_category/all_category.dart'
    as _i1;
import 'package:e_commercial/presentation/pages/forgot_password/forgot_password.dart'
    as _i2;
import 'package:e_commercial/presentation/pages/main_screen/main_screen.dart'
    as _i3;
import 'package:e_commercial/presentation/pages/product/product_screen.dart'
    as _i5;
import 'package:e_commercial/presentation/pages/product_detail/product_detail.dart'
    as _i4;
import 'package:e_commercial/presentation/pages/signin/signin.dart' as _i6;
import 'package:e_commercial/presentation/pages/signup/signup.dart' as _i7;
import 'package:e_commercial/presentation/pages/splash/splash_screen.dart'
    as _i8;
import 'package:flutter/material.dart' as _i10;

/// generated route for
/// [_i1.AllCategoriesScreen]
class AllCategoriesRoute extends _i9.PageRouteInfo<void> {
  const AllCategoriesRoute({List<_i9.PageRouteInfo>? children})
      : super(AllCategoriesRoute.name, initialChildren: children);

  static const String name = 'AllCategoriesRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.AllCategoriesScreen();
    },
  );
}

/// generated route for
/// [_i2.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i9.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i9.PageRouteInfo>? children})
      : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.ForgotPasswordScreen();
    },
  );
}

/// generated route for
/// [_i3.MainScreen]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute({List<_i9.PageRouteInfo>? children})
      : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.MainScreen();
    },
  );
}

/// generated route for
/// [_i4.ProductDetailScreen]
class ProductDetailRoute extends _i9.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i10.Key? key,
    required String productId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(key: key, productId: productId),
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailRouteArgs>();
      return _i4.ProductDetailScreen(key: args.key, productId: args.productId);
    },
  );
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({this.key, required this.productId});

  final _i10.Key? key;

  final String productId;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, productId: $productId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailRouteArgs) return false;
    return key == other.key && productId == other.productId;
  }

  @override
  int get hashCode => key.hashCode ^ productId.hashCode;
}

/// generated route for
/// [_i5.ProductScreen]
class ProductRoute extends _i9.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i10.Key? key,
    String? categoryId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(key: key, categoryId: categoryId),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductRouteArgs>(
        orElse: () => const ProductRouteArgs(),
      );
      return _i5.ProductScreen(key: args.key, categoryId: args.categoryId);
    },
  );
}

class ProductRouteArgs {
  const ProductRouteArgs({this.key, this.categoryId});

  final _i10.Key? key;

  final String? categoryId;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, categoryId: $categoryId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductRouteArgs) return false;
    return key == other.key && categoryId == other.categoryId;
  }

  @override
  int get hashCode => key.hashCode ^ categoryId.hashCode;
}

/// generated route for
/// [_i6.SignInScreen]
class SignInRoute extends _i9.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({_i10.Key? key, List<_i9.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>(
        orElse: () => const SignInRouteArgs(),
      );
      return _i6.SignInScreen(key: args.key);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignInRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i7.SignUpScreen]
class SignUpRoute extends _i9.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({_i10.Key? key, List<_i9.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignUpRouteArgs>(
        orElse: () => const SignUpRouteArgs(),
      );
      return _i7.SignUpScreen(key: args.key);
    },
  );
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignUpRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i8.SplashScreen]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashScreen();
    },
  );
}
