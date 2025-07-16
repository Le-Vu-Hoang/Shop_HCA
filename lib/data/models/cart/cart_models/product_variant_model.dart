import '../../../../domain/entities/cart.dart';

class ProductVariantModel extends ProductVariantEntity {
  ProductVariantModel({
    required super.name,
    required super.price,
    required super.status,
  });

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) {
    return ProductVariantModel(
      name: json['name'] as String,
      price: json['price'] as int,
      status: json['products']['status'] as String,
    );
  }
}