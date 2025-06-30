class ApiPaths {
  static const auth = _AuthPaths();
  static const category = _CategoryPaths();
  static const product = _ProductPaths();
  static const order = _OrderPaths();
  static const brand = _BrandPaths();
  static const subCategory = _SubCategoryPaths();
  static const notification = _NotificationPaths();
  static const address = _AddressPaths();
}

class _AuthPaths {
  const _AuthPaths();

  String get login => '/api/public/user-login';
  String get register => '/api/public/create-user';
  String get getUserInfor => '/api/user/get-user-by-id';
  String get updateUser => '/api/user/update-user-info';
  String get changePassword => '/api/user/change-password';
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

  String get createOrder => '/api/user/create-new-order';
  String get getAllOrders => '/api/user/get-all-orders';
  String cancelOrder (String id ) => '/api/user/cancel-order/$id';
  String getOrderDetail(String id) => '/api/user/get-order-detail/$id';
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

class _NotificationPaths {
  const _NotificationPaths();

  String get getAllNotifications => '/api/user/get-all-notify-me';
}

class _AddressPaths {
  const _AddressPaths();

  String get getAllAddresses => '/api/user/get-all-address';
  String get addAddress => '/api/user/add-shipping-address';
  String get updateAddress => '/api/user/update-shipping-address';
  String get deleteAddress => '/api/user/delete-address';
}