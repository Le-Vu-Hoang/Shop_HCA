import 'package:e_commercial/data/models/cart/req_params/add_item_req_params.dart';
import 'package:e_commercial/domain/entities/cart.dart';
import 'package:e_commercial/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCartItems extends CartEvent {
  @override
  List<Object?> get props => [];
}

class RemoveProductFromCart extends CartEvent {
  final ProductEntity product;

  RemoveProductFromCart(this.product);

  @override
  List<Object?> get props => [product];
}

class ClearCart extends CartEvent {}

class IncreaseProductQuantity extends CartEvent {
  final String variantId;

  IncreaseProductQuantity(this.variantId);

  @override
  List<Object?> get props => [variantId];
}

class DecreaseProductQuantity extends CartEvent {
  final String variantId;

  DecreaseProductQuantity(this.variantId);

  @override
  List<Object?> get props => [variantId];
}

class UpdateProductQuantity extends CartEvent {
  final String variantId;
  final int quantity;

  UpdateProductQuantity(this.variantId, this.quantity);

  @override
  List<Object?> get props => [variantId, quantity];
}

class ToggleVariantSelection extends CartEvent {
  final String variantId;

  ToggleVariantSelection(this.variantId);

  @override
  List<Object?> get props => [variantId];
}

class ToggleAllVariantsSelection extends CartEvent {
  final bool selectAll;

  ToggleAllVariantsSelection(this.selectAll);

  @override
  List<Object?> get props => [selectAll];
}

class ToggleBrandSelection extends CartEvent {
  final String brandId;
  final bool selected;

  ToggleBrandSelection(this.brandId, this.selected);

  @override
  List<Object?> get props => [brandId, selected];
}

