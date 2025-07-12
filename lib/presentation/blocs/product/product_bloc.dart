import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commercial/domain/usecases/Product/get_all_product.dart';
import 'package:e_commercial/presentation/blocs/product/product_event.dart';
import 'package:e_commercial/presentation/blocs/product/product_state.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../data/models/product/get_product_params.dart';
import '../../../domain/usecases/Product/get_all_product_by_filter.dart';
import '../../../injection/injection_container.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState()) {
    on<FetchProducts>(_onFetchProducts);
    on<FetchProductsByFilter>(_onFetchProductsByFilter);
    on<LoadMoreProducts>(_onLoadMoreProducts);
  }

  Future<void> _onFetchProducts(
      FetchProducts event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true, currentPage: 1));
    final result = await sl<GetAllProductUseCase>().call(
      params: GetProductsParams(page: 1, limit: 10),
    );
    result.fold(
          (failure) => emit(state.copyWith(
        errorMessage: failure.message,
        isLoading: false,
      )),
          (data) => emit(state.copyWith(
        products: data,
        isLoading: false,
        hasMore: data.isNotEmpty,
        currentPage: 1,
      )),
    );
  }

  Future<void> _onFetchProductsByFilter(
      FetchProductsByFilter event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true, currentPage: 1));
    final result = await sl<GetAllProductByFilter>().call(
      params: {'categoryId': event.filter},
    );
    result.fold(
          (failure) => emit(state.copyWith(
        errorMessage: failure.message,
        isLoading: false,
      )),
          (data) => emit(state.copyWith(
        products: data,
        isLoading: false,
        hasMore: data.isNotEmpty,
        currentPage: 1,
      )),
    );
  }

  Future<void> _onLoadMoreProducts(
      LoadMoreProducts event, Emitter<ProductState> emit) async {
    final page = state.currentPage + 1;
    emit(state.copyWith(isLoadingMore: true, currentPage: page));
    final result = await sl<GetAllProductUseCase>().call(
      params: GetProductsParams(page: page, limit: 10),
    );
    result.fold(
          (failure) => emit(state.copyWith(
        errorMessage: failure.message,
        isLoading: false,
        isLoadingMore: false,
      )),
          (data) => emit(state.copyWith(
        products: [...state.products, ...data],
        currentPage: page,
        isLoading: false,
        isLoadingMore: false,
        hasMore: data.isNotEmpty,
      )),
    );
  }
}