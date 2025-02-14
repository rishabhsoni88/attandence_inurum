// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HolidayResponse _$HolidayResponseFromJson(Map<String, dynamic> json) =>
    HolidayResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => HolidaysList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HolidayResponseToJson(HolidayResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

HolidaysList _$HolidaysListFromJson(Map<String, dynamic> json) => HolidaysList(
      holidayIdPK: (json['holiday_id_PK'] as num?)?.toInt(),
      holidayName: json['holiday_name'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$HolidaysListToJson(HolidaysList instance) =>
    <String, dynamic>{
      'holiday_id_PK': instance.holidayIdPK,
      'holiday_name': instance.holidayName,
      'date': instance.date,
    };
