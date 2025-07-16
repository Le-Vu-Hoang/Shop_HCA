import 'package:hive/hive.dart';

import '../../../../domain/entities/cart.dart';
import '../cart_models/cart_item_model.dart';
import '../cart_models/cart_model.dart';
import 'local_cart_item_model.dart';

part 'local_cart_model.g.dart';

@HiveType(typeId: 2)
class LocalCartModel extends HiveObject {
  @HiveField(0)
  final String brandId;

  @HiveField(1)
  final String brandName;

  @HiveField(2)
  final String brandImage;

  @HiveField(3)
  final List<LocalCartItemModel> items;

  LocalCartModel({
    required this.brandId,
    required this.brandName,
    required this.brandImage,
    required this.items,
  });

  factory LocalCartModel.fromModel(CartModel model) {
    return LocalCartModel(
      brandId: model.brandId,
      brandName: model.brandName,
      brandImage: model.brandImage,
      items: model.items
          .map((e) => LocalCartItemModel.fromModel(e as CartItemModel))
          .toList(),
    );
  }

  CartEntity toEntity() {
    return CartEntity(
      brandId: brandId,
      brandName: brandName,
      brandImage: brandImage,
      items: items.map((e) => e.toEntity()).toList(),
    );
  }
}
