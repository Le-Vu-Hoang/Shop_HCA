import 'package:hive/hive.dart';

import '../../models/cart/local_cart_model/local_cart_item_model.dart';
import '../../models/cart/local_cart_model/local_cart_model.dart';
import '../../models/cart/local_cart_model/local_product_variant_model.dart';
import '../../models/user/local_user_model.dart';

class HiveService {
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(LocalUserModelAdapter());
      Hive.registerAdapter(LocalCartModelAdapter());
      Hive.registerAdapter(LocalCartItemModelAdapter());
      Hive.registerAdapter(LocalProductVariantModelAdapter());
    }
    await Hive.openBox<LocalUserModel>('userBox');
    await Hive.openBox<LocalCartModel>('cartBox');
  }

  //                USER
  //=============================================
  // Get the current user
  LocalUserModel? getCurrentUser() {
    final box = Hive.box<LocalUserModel>('userBox');
    return box.get('user');
  }

  // Save the current user
  Future<void> saveUser(LocalUserModel user) async {
    final box = Hive.box<LocalUserModel>('userBox');
    await box.put('user', user);
  }

  //=============================================

  //                CART
  //=============================================
  /// Save a cart (grouped by brandId)
  Future<void> saveCart(LocalCartModel cart) async {
    final box = Hive.box<LocalCartModel>('cartBox');
    await box.put(cart.brandId, cart); // Use brandId as key
  }

  /// Get all cart items
  List<LocalCartModel> getAllCarts() {
    final box = Hive.box<LocalCartModel>('cartBox');
    return box.values.toList();
  }

  /// Get cart by brandId
  LocalCartModel? getCartByBrandId(String brandId) {
    final box = Hive.box<LocalCartModel>('cartBox');
    return box.get(brandId);
  }

  /// Remove cart by brandId
  Future<void> removeCart(String brandId) async {
    final box = Hive.box<LocalCartModel>('cartBox');
    await box.delete(brandId);
  }

  /// Clear all cart data
  Future<void> clearAllCarts() async {
    final box = Hive.box<LocalCartModel>('cartBox');
    await box.clear();
  }

  //=============================================
}
