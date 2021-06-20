import 'dart:convert';

UpdateModel updateModelFromJson(String str) => UpdateModel.fromJson(json.decode(str));

String updateModelToJson(UpdateModel data) => json.encode(data.toJson());

class UpdateModel {
    UpdateModel({
        this.name,
        this.job,
        this.updatedAt,
    });

    String name;
    String job;
    DateTime updatedAt;

    factory UpdateModel.fromJson(Map<String, dynamic> json) => UpdateModel(
        name: json["name"],
        job: json["job"],
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "updatedAt": updatedAt.toIso8601String(),
    };
}