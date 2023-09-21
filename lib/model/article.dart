class Article{
  int? id;
  String name;
  double? price;
  String? shop;
  String? image;
  int categories;

  Article(this.id, this.name, this.price, this.shop, this.image, this.categories);

  Article.fromMap(Map<String, dynamic> map):
      id = map["id"],
      name = map["name"],
      price = map["price"],
      shop = map["shop"],
      image = map["image"],
      categories = map["categories"];

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map ={
      "name": name,
      "price": price,
      "shop": shop,
      "image": image,
      "categories": categories,
    };
    if(id != null) map['id'] = id;
    return map;
  }
}