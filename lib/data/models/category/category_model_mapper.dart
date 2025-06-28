import 'package:e_commercial/domain/entities/category.dart';
import 'category_model.dart';

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      categoryName: name,
      description: description,
      imageLink: imageLink,
    );
  }
}
