import 'package:e_commercial/data/models/product/product_model.dart';
import 'package:e_commercial/domain/entities/product.dart';

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
        id: id,
        categoryId: categoryId,
        subCategoryId: subCategoryId,
        brandId: brandId,
        name: name,
        origin:  origin,
        averagePrice: averagePrice,
        otherVariant: otherVariant,
        status: status,
        promotion: promotion,
        imageProducts: imageProducts,
    );
  }
}