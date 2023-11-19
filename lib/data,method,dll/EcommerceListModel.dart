// To parse this JSON data, do
//
//     final ecommercelistmodel = ecommercelistmodelFromJson(jsonString);

import 'dart:convert';

List<Ecommercelistmodel> ecommercelistmodelFromJson(String str) => List<Ecommercelistmodel>.from(json.decode(str).map((x) => Ecommercelistmodel.fromJson(x)));

String ecommercelistmodelToJson(List<Ecommercelistmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class categories{
  int id;
  String title;

  categories({
    required this.id,
    required this.title,
});

  factory categories.fromJson(Map<String,dynamic> json) => categories(
      id: json["id"],
      title: json["title"]);
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };

}

class Ecommercelistmodel {
  int id;
  String title;
  double price;
  String? description;
  Category? category;
  String image;
  Rating? rating;

  Ecommercelistmodel({
    required this.id,
    required this.title,
    required this.price,
     this.description,
     this.category,
    required this.image,
     this.rating,
  });

  factory Ecommercelistmodel.fromJson(Map<String, dynamic> json) => Ecommercelistmodel(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: categoryValues.map[json["category"]]!,
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": categoryValues.reverse[category],
    "image": image,
    "rating": rating?.toJson(),
  };
}

enum Category {
  ELECTRONICS,
  JEWELERY,
  MEN_S_CLOTHING,
  WOMEN_S_CLOTHING
}

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"]?.toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
