// To parse this JSON data, do
//
//     final postRequestModel = postRequestModelFromJson(jsonString);

import 'dart:convert';

PostRequestModel postRequestModelFromJson(String str) =>
    PostRequestModel.fromJson(json.decode(str));

String postRequestModelToJson(PostRequestModel data) =>
    json.encode(data.toJson());

class PostRequestModel {
  PostRequestModel({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  String name;
  String job;
  String id;
  DateTime createdAt;

  factory PostRequestModel.fromJson(Map<String, dynamic> json) =>
      PostRequestModel(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
      };
}
