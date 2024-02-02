// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? userId;
  int? id;
  String? title;
  String? error;
  bool? completed;

  UserModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed,
      required this.error});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
        "error": error,
      };
  UserModel.withError(String message) {
    error = message;
  }
}
