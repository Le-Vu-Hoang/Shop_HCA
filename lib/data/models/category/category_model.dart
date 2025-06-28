class CategoryModel {
  final String id;
  final String name;
  final String description;
  final String? imageLink;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    this.imageLink,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageLink: json['image_link'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image_link': imageLink,
    };
  }
}