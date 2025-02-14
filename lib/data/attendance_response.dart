import 'package:json_annotation/json_annotation.dart';

part 'attendance_response.g.dart';

@JsonSerializable()
class AttendanceResponse {
  bool? status;
  String? message;
  AttendanceData? data;

  AttendanceResponse({this.status, this.message, this.data});

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) => _$AttendanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceResponseToJson(this);
}

@JsonSerializable()
class AttendanceData {
  int? id;
  @JsonKey(name: 'user_id_FK')
  int? userIdFK;
  String? date;
  @JsonKey(name: 'check_in_time')
  int? checkInTime;
  @JsonKey(name: 'check_out_time')
  int? checkOutTime;
  int? status;
  @JsonKey(name: 'device_id_FK')
  int? deviceIdFK;
  @JsonKey(name: 'total_working_hours')
  int? totalWorkingHours;
  @JsonKey(name: 'total_office_hours')
  int? totalOfficeHours;
  @JsonKey(name: 'break_time')
  int? breakTime;
  @JsonKey(name: 'attendance_logs_ids')
  String? attendanceLogsIds;

  AttendanceData(
      {this.id,
        this.userIdFK,
        this.date,
        this.checkInTime,
        this.checkOutTime,
        this.status,
        this.deviceIdFK,
        this.totalWorkingHours,
        this.totalOfficeHours,
        this.breakTime,
        this.attendanceLogsIds});

  factory AttendanceData.fromJson(Map<String, dynamic> json) => _$AttendanceDataFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceDataToJson(this);
}