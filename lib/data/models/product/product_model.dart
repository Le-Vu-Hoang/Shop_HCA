class ProductModel {
  final String id;
  final String categoryId;
  final String subCategoryId;
  final String brandId;
  final String name;
  final String origin;
  final String averagePrice;
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
      averagePrice: json['average_price'] as String,
      status: json['status'] as String,
      promotion: json['promotion'] as int,
      imageProducts: List<String>.from(json['image_products'] as List<dynamic>),
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
      'status': status,
      'promotion': promotion,
      'image_products': imageProducts,
    };
  }
}
