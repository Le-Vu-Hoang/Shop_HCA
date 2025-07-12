import 'package:e_commercial/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  final List<ProductEntity> products;
  final bool isLoading;
  final bool isLoadingMore;
  final int currentPage;
  final bool hasMore;
  final String? errorMessage;
  final String? currentFilter;

  const ProductState({
    this.products = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.currentPage = 1,
    this.hasMore = true,
    this.errorMessage,
    this.currentFilter,
});

  ProductState copyWith({
    List<ProductEntity>? products,
    bool? isLoading,
    bool? isLoadingMore,
    int? currentPage,
    bool? hasMore,
    String? errorMessage,
    String? currentFilter,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      errorMessage: errorMessage ?? this.errorMessage,
      currentFilter: currentFilter ?? this.currentFilter,
    );
  }

  @override
  List<Object?> get props => [products, isLoading, isLoadingMore, currentPage, hasMore, currentFilter,];

}