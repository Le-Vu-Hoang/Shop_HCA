class ProductModel {
  final String id;
  final String categoryId;
  final String subCategoryId;
  final String brandId;
  final String name;
  final String origin;
  final int averagePrice;
  final bool otherVariant;
  final String status;
  final int promotion;
  final List<String> imageProducts;

  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      subCategoryId: json['subcategory_id'] as String,
      brandId: json['brand_id'] as String,
      name: json['name'] as String,
      origin: json['origin'] as String,
      averagePrice: int.tryParse(json['average_price'].toString()) ?? 0,
      otherVariant: json['other_variant'] as bool? ?? false,
      status: json['status'] as String,
      promotion: int.tryParse(json['promotion'].toString()) ?? 0,
      imageProducts: (json['image_products'] as List)
          .map((img) => img['image_link'].toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'subcategory_id': subCategoryId,
      'brand_id': brandId,
      'name': name,
      'origin': origin,
      'average_price': averagePrice,
      'other_variant': otherVariant,
      'status': status,
      'promotion': promotion,
      'image_products': imageProducts,
    };
  }
}
