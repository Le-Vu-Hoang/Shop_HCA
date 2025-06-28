import 'package:e_commercial/data/models/product_variant/product_variant_model.dart';

import '../../../domain/entities/product_variant.dart';

extension ProductVariantXModel on ProductVariantModel {
  ProductVariantEntity toEntity() {
    return ProductVariantEntity(
      id: id,
      productId: productId,
      name: name,
      price: price,
      stock: stock,
      sku: sku,
      status: status,
      hasAttributes: hasAttributes,

    );
  }
}