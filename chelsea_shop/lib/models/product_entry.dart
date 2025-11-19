// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(
  json.decode(str).map((x) => ProductEntry.fromJson(x)),
);

String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String id;
  String name;
  String description;
  int price;
  int stock;
  String category;
  String thumbnail;
  bool isSale;
  int userId;
  String username;

  ProductEntry({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.category,
    required this.thumbnail,
    required this.isSale,
    required this.userId,
    required this.username,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    stock: json["stock"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    isSale: json["is_sale"],
    userId: json["user_id"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "stock": stock,
    "category": category,
    "thumbnail": thumbnail,
    "is_sale": isSale,
    "user_id": userId,
    "username": username,
  };
}
