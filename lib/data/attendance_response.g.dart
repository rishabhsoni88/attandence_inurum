// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceResponse _$AttendanceResponseFromJson(Map<String, dynamic> json) =>
    AttendanceResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AttendanceData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttendanceResponseToJson(AttendanceResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

AttendanceData _$AttendanceDataFromJson(Map<String, dynamic> json) =>
    AttendanceData(
      id: (json['id'] as num?)?.toInt(),
      userIdFK: (json['user_id_FK'] as num?)?.toInt(),
      date: json['date'] as String?,
      checkInTime: (json['check_in_time'] as num?)?.toInt(),
      checkOutTime: (json['check_out_time'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      deviceIdFK: (json['device_id_FK'] as num?)?.toInt(),
      totalWorkingHours: (json['total_working_hours'] as num?)?.toInt(),
      totalOfficeHours: (json['total_office_hours'] as num?)?.toInt(),
      breakTime: (json['break_time'] as num?)?.toInt(),
      attendanceLogsIds: json['attendance_logs_ids'] as String?,
    );

Map<String, dynamic> _$AttendanceDataToJson(AttendanceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id_FK': instance.userIdFK,
      'date': instance.date,
      'check_in_time': instance.checkInTime,
      'check_out_time': instance.checkOutTime,
      'status': instance.status,
      'device_id_FK': instance.deviceIdFK,
      'total_working_hours': instance.totalWorkingHours,
      'total_office_hours': instance.totalOfficeHours,
      'break_time': instance.breakTime,
      'attendance_logs_ids': instance.attendanceLogsIds,
    };
