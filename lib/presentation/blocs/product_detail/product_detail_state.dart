import 'package:e_commercial/domain/entities/product.dart';

import '../../../domain/entities/product_detail.dart';

abstract class ProductDetailState {}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoaded extends ProductDetailState {
  final ProductDetailEntity product;

  ProductDetailLoaded({required this.product});
}

class ProductDetailError extends ProductDetailState {
  final String errorMessage;

  ProductDetailError({required this.errorMessage});
}

class ShowVariantDialog extends ProductDetailState {
  final ProductDetailEntity product;
  ShowVariantDialog({required this.product});
}

