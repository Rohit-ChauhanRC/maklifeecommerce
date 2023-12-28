import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

ProductModel productModelFromMap(String str) =>
    ProductModel.fromMap(json.decode(str));

String productModelToMap(ProductModel data) => json.encode(data.toMap());

class ProductModel {
  final int? id;
  final String name;
  final String weight;
  final int price;
  final int? quantity;
  final String? description;
  final Uint8List? picture;

  ProductModel({
    this.id,
    required this.name,
    required this.weight,
    required this.price,
    this.quantity,
    this.description,
    this.picture,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        weight: json["weight"] ?? "",
        price: json["price"] ?? 0,
        quantity: int.tryParse(json["quantity"] ?? 0) ?? 0,
        description: json["description"] ?? "",
        picture: json["picture"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "weight": weight,
        "price": price,
        "quantity": quantity,
        "description": description,
        "picture": picture,
      };
}
