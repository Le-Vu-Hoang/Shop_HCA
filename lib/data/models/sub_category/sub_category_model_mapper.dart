import 'package:e_commercial/data/models/sub_category/sub_category_model.dart';
import 'package:e_commercial/domain/entities/sub_category.dart';

extension SubCategoryXModel on SubCategoryModel {
  SubCategoryEntity toEntity() {
    return SubCategoryEntity(
      id: id,
      categoryId: categoryId,
      name: name,
      description: description,
    );
  }
}