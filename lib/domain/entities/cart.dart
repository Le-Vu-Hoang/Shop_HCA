class CartEntity {
  final String brandId;
  final String brandName;
  final String brandImage;
  final List<CartItemEntity> items;

  CartEntity({
    required this.brandId,
    required this.brandName,
    required this.brandImage,
    required this.items,
  });
}

class CartItemEntity {
  final String id;
  final String variantId;
  final String imageLink;
  final int amount;
  final bool pinned;
  final ProductVariantEntity productVariant;

  CartItemEntity({
    required this.id,
    required this.variantId,
    required this.imageLink,
    required this.amount,
    required this.pinned,
    required this.productVariant,
  });
}

class ProductVariantEntity {
  final String name;
  final int price;
  final String status;

  ProductVariantEntity({
    required this.name,
    required this.price,
    required this.status,
  });
}
