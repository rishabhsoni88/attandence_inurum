// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetResponse _$ForgetResponseFromJson(Map<String, dynamic> json) =>
    ForgetResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      id: json['id'] as bool?,
    );

Map<String, dynamic> _$ForgetResponseToJson(ForgetResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'id': instance.id,
    };
