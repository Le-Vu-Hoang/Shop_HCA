import 'package:e_commercial/data/models/cart/cart_models/product_variant_model.dart';

import '../../../../domain/entities/cart.dart';

class CartItemModel extends CartItemEntity {
  CartItemModel({
    required super.id,
    required super.variantId,
    required super.imageLink,
    required super.amount,
    required super.pinned,
    required super.productVariant,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] as String,
      variantId: json['variant_id'] as String,
      imageLink: json['image_link'] as String,
      amount: json['amount'] as int,
      pinned: json['pinned'] as bool,
      productVariant:
      ProductVariantModel.fromJson(json['product_variants']),
    );
  }
}