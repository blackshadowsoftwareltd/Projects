import 'package:json_annotation/json_annotation.dart';

part 'UserModel.g.dart';

@JsonSerializable()
class UserModel {
  UserModel();

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;

  @JsonKey(name: 'avatar')
  String avatar;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

/// then write this code inside Terminal>>> flutter pub run build_runner build
}
