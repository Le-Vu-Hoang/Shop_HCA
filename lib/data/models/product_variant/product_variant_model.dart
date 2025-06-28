class ProductVariantModel {
  final String id;
  final String productId;
  final String name;
  final String sku;
  final int price;
  final int stock;
  final bool status;
  final bool hasAttributes;

  ProductVariantModel({
    required this.id,
    required this.productId,
    required this.name,
    required this.sku,
    required this.price,
    required this.stock,
    required this.status,
    required this.hasAttributes,
  });

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) {
    return ProductVariantModel(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      name: json['name'] as String,
      sku: json['sku'] as String,
      price: json['price'] as int,
      stock: json['stock'] as int,
      status: json['status'] as bool,
      hasAttributes: json['has_attributes'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'name': name,
      'sku': sku,
      'price': price,
      'stock': stock,
      'status': status,
      'has_attributes': hasAttributes,
    };
  }
}