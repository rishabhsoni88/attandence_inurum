import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  bool? success;
  String? message;
  LoginData? data;

  LoginResponse({this.success, this.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}

@JsonSerializable()
class LoginData {
  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? token;

  LoginData({this.userId, this.firstName, this.lastName, this.email, this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}




