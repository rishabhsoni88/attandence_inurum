import 'package:json_annotation/json_annotation.dart';
part 'forget_response.g.dart';
@JsonSerializable()
class ForgetResponse {
  bool? status;
  String? message;
  bool? id;

  ForgetResponse({this.status, this.message, this.id});

  factory ForgetResponse.fromJson(Map<String, dynamic> json) => _$ForgetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetResponseToJson(this);
}