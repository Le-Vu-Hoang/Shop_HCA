import 'package:hive/hive.dart';

import '../../../../domain/entities/cart.dart';
import '../cart_models/product_variant_model.dart';

part 'local_product_variant_model.g.dart';


@HiveType(typeId: 4)
class LocalProductVariantModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int price;

  @HiveField(2)
  final String status;

  LocalProductVariantModel({
    required this.name,
    required this.price,
    required this.status,
  });

  factory LocalProductVariantModel.fromModel(ProductVariantModel model) {
    return LocalProductVariantModel(
      name: model.name,
      price: model.price,
      status: model.status,
    );
  }

  ProductVariantEntity toEntity() {
    return ProductVariantEntity(
      name: name,
      price: price,
      status: status,
    );
  }
}
