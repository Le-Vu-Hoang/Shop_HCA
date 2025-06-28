class ProductVariantEntity {
  final String id;
  final String productId;
  final String name;
  final String sku;
  final int price;
  final int stock;
  final bool status;
  final bool hasAttributes;

  ProductVariantEntity({
    required this.id,
    required this.productId,
    required this.name,
    required this.sku,
    required this.price,
    required this.stock,
    required this.status,
    required this.hasAttributes,
  });
}