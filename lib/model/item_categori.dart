class ItemCategories{
  int id;
  String name;

  ItemCategories({required this.id, required this.name});

  ItemCategories.fromMap(Map<String, dynamic> map):
      id = map["id"],
      name = map["name"];
}