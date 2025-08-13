enum CategoryType {
  income,
  expense,
}

class CategoryEntities {
  final String name;
  final CategoryType type;

  CategoryEntities({
    required this.name,
    required this.type,
  });
}
