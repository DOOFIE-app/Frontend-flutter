class Category {
  final String name;
  final String type;
  final num id;
  bool isSelected = false;

  Category({this.name, this.type = 'category', this.id});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        name: json['categoryName'] ?? '', id: json['categoryId'] ?? '');
  }

  @override
  String toString() {
    return 'name: $name, type: $type, isSelected: $isSelected, id: $id';
  }
}

class ListCategory {
  final num id;
  final String name;

  ListCategory({this.name, this.id});

  factory ListCategory.fromJson(Map<String, dynamic> json) {
    return ListCategory(name: json['name'] ?? '', id: json['id'] ?? '');
  }

  @override
  String toString() {
    return 'name: $name, id: $id';
  }
}

class CategoryList {
  List<ListCategory> categories = [];

  CategoryList({this.categories});

  factory CategoryList.fromJson(List<dynamic> items) {
    final _categories =
        items.map((dynamic item) => ListCategory.fromJson(item)).toList();
    return CategoryList(categories: _categories);
  }
}
