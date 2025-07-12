import '../../../domain/entities/sub_category.dart';

abstract class SubCategoryState {}

class SubCategoryInitial extends SubCategoryState {}

class SubCategoryLoading extends SubCategoryState {}

class SubCategoryLoaded extends SubCategoryState {
  final List<SubCategoryEntity> subCategories;

  SubCategoryLoaded({required this.subCategories});
}

class SubCategoryFailed extends SubCategoryState {
  final String error;

  SubCategoryFailed({required this.error});
}