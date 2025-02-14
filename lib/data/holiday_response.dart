import 'package:json_annotation/json_annotation.dart';

part 'holiday_response.g.dart';

@JsonSerializable()
class HolidayResponse {
  bool? status;
  String? message;
  List<HolidaysList>? data;

  HolidayResponse({this.status, this.message, this.data});

  factory HolidayResponse.fromJson(Map<String, dynamic> json) => _$HolidayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HolidayResponseToJson(this);
}

@JsonSerializable()
class HolidaysList {
  @JsonKey(name: 'holiday_id_PK')
  int? holidayIdPK;
  @JsonKey(name: 'holiday_name')
  String? holidayName;
  String? date;

  HolidaysList({this.holidayIdPK, this.holidayName, this.date});

  factory HolidaysList.fromJson(Map<String, dynamic> json) => _$HolidaysListFromJson(json);

  Map<String, dynamic> toJson() => _$HolidaysListToJson(this);
}