import 'package:json_annotation/json_annotation.dart';
import 'UserModel.dart';

part 'single_user_response.g.dart';

@JsonSerializable()
class SingleUserResponse {
  SingleUserResponse();

  @JsonKey(name: 'data')
  UserModel user;

  factory SingleUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SingleUserResponseToJson(this);

/// then write this code inside Terminal>>> flutter pub run build_runner build
}
