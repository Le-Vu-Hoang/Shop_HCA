class CategoryEntity {
  final String id;
  final String categoryName;
  final String description;
  final String? imageLink;

  CategoryEntity({
    required this.id,
    required this.categoryName,
    required this.description,
    this.imageLink
  });
}