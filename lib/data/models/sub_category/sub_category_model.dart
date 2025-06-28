class SubCategoryModel {
  final String id;
  final String categoryId;
  final String name;
  final String description;

  SubCategoryModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'name': name,
      'description': description,
    };
  }
}