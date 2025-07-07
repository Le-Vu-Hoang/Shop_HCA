import 'package:e_commercial/domain/entities/category.dart';

abstract class CategoryDisplayState {}

class CategoryLoading extends CategoryDisplayState{}

class CategoryLoaded extends CategoryDisplayState{
  final List<CategoryEntity>  categories;

  CategoryLoaded({required this.categories});
}

class LoadCategoryFailure extends CategoryDisplayState{
  final String errorMessage;

  LoadCategoryFailure({required this.errorMessage});
}