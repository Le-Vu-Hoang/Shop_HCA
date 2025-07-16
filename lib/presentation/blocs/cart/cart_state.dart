import 'package:e_commercial/domain/entities/cart.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/cart/cart_models/cart_model.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {
  CartInitial();

  @override
  List<Object?> get props => [];
}

class CartUpdated extends CartState {
  final List<CartEntity> cartItems;
  final int totalAmount;
  final List<CartItemEntity> selectedItems;

  CartUpdated(this.cartItems, this.totalAmount, this.selectedItems);

  @override
  List<Object?> get props => [cartItems, totalAmount, selectedItems];
}

class CartError extends CartState {
  final String message;

  CartError({required this.message});

  @override
  List<Object?> get props => [message];
}
