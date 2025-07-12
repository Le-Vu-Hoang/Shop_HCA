import 'package:bloc/bloc.dart';
import 'package:e_commercial/presentation/blocs/sub_category/sub_category_state.dart';

import '../../../domain/usecases/SubCategory/get_by_category.dart';
import '../../../injection/injection_container.dart';

class SubCategoryDisplayCubit extends Cubit<SubCategoryState> {
  final String? categoryId;
  SubCategoryDisplayCubit(this.categoryId) : super(SubCategoryInitial());

  void displaySubCategory() async {
    if (categoryId == null) return;
    var data = await sl<SubGetAllByCateIdUSeCase>().call(params: categoryId);
    data.fold(
      (failure) => emit(SubCategoryFailed(error: failure.message)),
      (data) => emit(SubCategoryLoaded(subCategories: data)),
    );
  }
}
