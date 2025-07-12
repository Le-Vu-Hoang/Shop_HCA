class ProductDetailEntity {
  final String id;
  final String categoryId;
  final String subCategoryId;
  final String brandId;
  final String name;
  final String origin;
  final String description;
  final int averagePrice;
  final String status;
  final int stock;
  final int promotion;
  final List<String> imageProducts;
  final List<ProductVariantE> productVariants;
  final int wishlist;

  ProductDetailEntity({
    required this.id,
    required this.categoryId,
    required this.subCategoryId,
    required this.brandId,
    required this.name,
    required this.origin,
    required this.description,
    required this.averagePrice,
    required this.status,
    required this.stock,
    required this.promotion,
    required this.imageProducts,
    required this.productVariants,
    required this.wishlist,
  });
}

class ProductVariantE {
  final String id;
  final String name;
  final int price;
  final String sku;
  final List<ProductAttributeEntity> attributes;

  ProductVariantE({
    required this.id,
    required this.name,
    required this.price,
    required this.sku,
    required this.attributes,
  });
}

class ProductAttributeEntity {
  final String name;
  final String value;

  ProductAttributeEntity({
    required this.name,
    required this.value,
  });
}
