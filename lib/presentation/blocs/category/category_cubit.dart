import 'package:bloc/bloc.dart';
import 'package:e_commercial/domain/usecases/Category/get_all_category.dart';
import '../../../injection/injection_container.dart';
import 'category_state.dart';

class CategoryDisplayCubit extends Cubit<CategoryDisplayState> {
  CategoryDisplayCubit() : super(CategoryLoading());

  void displayCategories() async {
    var data = await sl<GetAllCategoryUseCase>().call();
    data.fold(
        (failure) => emit(LoadCategoryFailure(errorMessage: failure.message)),
        (data) => emit(CategoryLoaded(categories: data)),
    );
  }
}