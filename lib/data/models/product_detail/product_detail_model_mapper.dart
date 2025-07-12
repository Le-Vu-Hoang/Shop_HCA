import 'package:e_commercial/data/models/product_detail/product_detail_model.dart';
import '../../../domain/entities/product_detail.dart';

extension ProductDetailXModel on ProductDetailModel {
  ProductDetailEntity toEntity() {
    return ProductDetailEntity(
      id: id,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      brandId: brandId,
      name: name,
      origin: origin,
      description: description,
      averagePrice: averagePrice,
      status: status,
      stock: stock,
      promotion: promotion,
      imageProducts: imageProducts,
      productVariants:
      productVariants.map((v) => (v as ProductVariantEModel).toEntity()).toList(),
      wishlist: wishlist,
    );
  }
}

extension ProductVariantModelX on ProductVariantEModel {
  ProductVariantE toEntity() {
    return ProductVariantE(
      id: id,
      name: name,
      price: price,
      sku: sku,
      attributes:
      attributes.map((a) => (a as ProductAttributeModel).toEntity()).toList(),
    );
  }
}

extension ProductAttributeModelX on ProductAttributeModel {
  ProductAttributeEntity toEntity() {
    return ProductAttributeEntity(
      name: name,
      value: value,
    );
  }
}
