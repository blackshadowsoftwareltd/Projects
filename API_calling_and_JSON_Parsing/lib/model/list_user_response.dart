import 'package:API_calling_and_JSON_Parsing/model/UserModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_user_response.g.dart';

@JsonSerializable()
class ListUserResponse {
  ListUserResponse();

  @JsonKey(name: 'page')
  int page;
  @JsonKey(name: 'per_page')
  int per_page;
  @JsonKey(name: 'total')
  int total;
  @JsonKey(name: 'total_pages')
  int total_pages;
  @JsonKey(name: 'data')
  List<UserModel> users;

  factory ListUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListUserResponseToJson(this);
}
