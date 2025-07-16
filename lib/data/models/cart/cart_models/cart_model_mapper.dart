import 'package:e_commercial/data/models/cart/cart_models/product_variant_model.dart';
import '../../../../domain/entities/cart.dart';
import 'cart_item_model.dart';
import 'cart_model.dart';

extension CartModelX on CartModel {
  CartEntity toEntity() {
    return CartEntity(
      brandId: brandId,
      brandName: brandName,
      brandImage: brandImage,
      items: items
          .map((item) => (item as CartItemModel).toEntity())
          .toList(),
    );
  }
}

extension CartItemModelX on CartItemModel {
  CartItemEntity toEntity() {
    return CartItemEntity(
      id: id,
      variantId: variantId,
      imageLink: imageLink,
      amount: amount,
      pinned: pinned,
      productVariant: (productVariant as ProductVariantModel).toEntity(),
    );
  }
}

extension ProductVariantModelX on ProductVariantModel {
  ProductVariantEntity toEntity() {
    return ProductVariantEntity(
      name: name,
      price: price,
      status: status,
    );
  }
}