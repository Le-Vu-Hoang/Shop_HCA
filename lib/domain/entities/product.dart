class ProductEntity {
  final String id;
  final String categoryId;
  final String subCategoryId;
  final String brandId;
  final String name;
  final String origin;
  final String averagePrice;
  final bool otherVariant;
  final String status;
  final int promotion;
  final List<String> imageProducts;

  ProductEntity({
    required this.id,
    required this.categoryId,
    required this.subCategoryId,
    required this.brandId,
    required this.name,
    required this.origin,
    required this.averagePrice,
    required this.otherVariant,
    required this.status,
    required this.promotion,
    required this.imageProducts,
  });
}
