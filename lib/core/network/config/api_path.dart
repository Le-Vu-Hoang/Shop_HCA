class ApiPaths {
  static const auth = _AuthPaths();
  static const category = _CategoryPaths();
  static const product = _ProductPaths();
  static const order = _OrderPaths();
  static const brand = _BrandPaths();
}

class _AuthPaths {
  const _AuthPaths();

  String get login => '/api/public/user-login';
  String get register => '/api/public/create-user';
  String getUserInfor(String id) => '/api/user/get-user-by-id/$id';
  String updateUser(String id) => '/api/user/update-user-info/$id';
  String changePassword(String id) => '/api/user/change-password/$id';
  String get refreshToken => '/api/auth/refresh';
}

class _CategoryPaths {
  const _CategoryPaths();

  String get getAllCategories => '/api/public/get-all-category';
}

class _ProductPaths {
  const _ProductPaths();

  String get getAllProducts => '/api/public/get-all-products';
  String getProductById(String id) => '/api/public/get-product-by-id/$id';
  String getVariantOfProduct(String id) => '/api/public/get-all-variants/$id';
  String getVariantById(String id) => '/api/public/get-variant-by-id/$id';
}

class _OrderPaths {
  const _OrderPaths();

  String get getAllOrders => '/api/public/get-all-orders';
  String get getOrderById => '/api/public/get-order-by-id';
}

class _BrandPaths {
  const _BrandPaths();

  String getBrandInfor(String id) => '/api/public/get-brand-by-id/$id';
}

class _SubCategoryPaths {
  const _SubCategoryPaths();

  String getAllSubCategories(String categoryId) => '/api/public/get-all-sub-from-category/$categoryId';
  String getSubCategoryById(String id) => '/api/public/get-sub-category/$id';
}