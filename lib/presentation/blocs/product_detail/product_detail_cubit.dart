import 'package:bloc/bloc.dart';
import 'package:e_commercial/presentation/blocs/product_detail/product_detail_state.dart';

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
}
