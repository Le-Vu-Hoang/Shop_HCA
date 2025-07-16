import 'package:bloc/bloc.dart';
import 'package:e_commercial/data/models/cart/req_params/add_item_req_params.dart';
import 'package:e_commercial/presentation/blocs/product_detail/product_detail_state.dart';

import '../../../domain/usecases/Cart/add_to_cart.dart';
import '../../../domain/usecases/Product/get_product_by_id.dart';
import '../../../injection/injection_container.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final String productId;

  ProductDetailCubit(this.productId) : super(ProductDetailInitial());

  void loadProduct() async {
    emit(ProductDetailLoading());
    var product = await sl<GetProductByIdUseCase>().call(params: productId);
    product.fold(
        (failure) => emit(ProductDetailError(errorMessage: failure.message)),
        (data) => emit(ProductDetailLoaded(product: data)));
  }

  void showVariantDialog() {
    final currentState = state;
    if (currentState is ProductDetailLoaded) {
      emit(ShowVariantDialog(product: currentState.product));
    }
  }

  void addToCart(String variantId, int quantity, String image) async {
    final params = AddCartReqParams(
      variantId: variantId,
      quantity: quantity,
      image: image,
    );
    final result = await sl<AddToCartUseCase>().call(params: params);
    result.fold(
      (failure) => emit(ProductDetailError(errorMessage: failure.message)),
      (_) => emit(ProductDetailLoaded(
          product: (state as ShowVariantDialog)
              .product)),
    );
  }
}
