import 'package:hive/hive.dart';
import '../../../../domain/entities/cart.dart';
import '../cart_models/cart_item_model.dart';
import '../cart_models/product_variant_model.dart';
import 'local_product_variant_model.dart';

part 'local_cart_item_model.g.dart';


@HiveType(typeId: 3)
class LocalCartItemModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String variantId;

  @HiveField(2)
  final String imageLink;

  @HiveField(3)
  final int amount;

  @HiveField(4)
  final bool pinned;

  @HiveField(5)
  final LocalProductVariantModel productVariant;

  LocalCartItemModel({
    required this.id,
    required this.variantId,
    required this.imageLink,
    required this.amount,
    required this.pinned,
    required this.productVariant,
  });

  factory LocalCartItemModel.fromModel(CartItemModel model) {
    return LocalCartItemModel(
      id: model.id,
      variantId: model.variantId,
      imageLink: model.imageLink,
      amount: model.amount,
      pinned: model.pinned,
      productVariant: LocalProductVariantModel.fromModel(
        model.productVariant as ProductVariantModel,
      ),
    );
  }

  CartItemEntity toEntity() {
    return CartItemEntity(
      id: id,
      variantId: variantId,
      imageLink: imageLink,
      amount: amount,
      pinned: pinned,
      productVariant: productVariant.toEntity(),
    );
  }
}
