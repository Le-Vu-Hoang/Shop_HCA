import '../../../../domain/entities/cart.dart';
import 'cart_item_model.dart';

class CartModel extends CartEntity {
  CartModel({
    required super.brandId,
    required super.brandName,
    required super.brandImage,
    required super.items,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      brandId: json['brand_id'] as String,
      brandName: json['brand_name'] as String,
      brandImage: json['brand_image'] as String,
      items: (json['items'] as List)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
    );
  }
}









