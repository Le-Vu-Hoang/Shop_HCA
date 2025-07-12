import '../../../domain/entities/product_detail.dart';

class ProductDetailModel extends ProductDetailEntity {
  ProductDetailModel({
    required super.id,
    required super.categoryId,
    required super.subCategoryId,
    required super.brandId,
    required super.name,
    required super.origin,
    required super.description,
    required super.averagePrice,
    required super.status,
    required super.stock,
    required super.promotion,
    required super.imageProducts,
    required super.productVariants,
    required super.wishlist,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      subCategoryId: json['subcategory_id'] as String,
      brandId: json['brand_id'] as String,
      name: json['name'] as String,
      origin: json['origin'] as String,
      description: json['description'] as String,
      averagePrice: json['average_price'] as int,
      status: json['status'] as String,
      stock: json['stock'] as int,
      promotion: json['promotion'] as int,
      imageProducts: (json['image_products'] as List)
          .map((img) => img['image_link'].toString())
          .toList(),
      productVariants: (json['product_variants'] as List)
          .map((variant) => ProductVariantEModel.fromJson(variant))
          .toList(),
      wishlist: json['featured_product']?['product_wishlist'] ?? 0,
    );
  }
}

class ProductVariantEModel extends ProductVariantE {
  ProductVariantEModel({
    required super.id,
    required super.name,
    required super.price,
    required super.sku,
    required super.attributes,
  });

  factory ProductVariantEModel.fromJson(Map<String, dynamic> json) {
    return ProductVariantEModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      sku: json['sku'] as String,
      attributes: (json['product_attributes'] as List)
          .map((att) => ProductAttributeModel.fromJson(att))
          .toList(),
    );
  }
}

class ProductAttributeModel extends ProductAttributeEntity {
  ProductAttributeModel({
    required super.name,
    required super.value,
  });

  factory ProductAttributeModel.fromJson(Map<String, dynamic> json) {
    return ProductAttributeModel(
      name: json['name_att'] as String,
      value: json['value_att'] as String,
    );
  }
}
