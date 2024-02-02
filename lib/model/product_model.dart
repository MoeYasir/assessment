// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  String? name;
  int? productPrice;
  int? quantity;
  String? error;

  String? id;

  ProductModel({
    required this.name,
    required this.productPrice,
    required this.quantity,
    required this.id,
    required this.error,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        productPrice: json["product_price"],
        quantity: json["quantity"],
        id: json["id"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "product_price": productPrice,
        "quantity": quantity,
        "id": id,
        "error": error,
      };
  ProductModel.withError(String message) {
    error = message;
  }
}
