import 'package:json_annotation/json_annotation.dart';

part 'user_data_response.g.dart';

@JsonSerializable()
class UserDataResponse {
  bool? status;
  String? message;
  UserDetails? data;

  UserDataResponse({this.status, this.message, this.data});

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}

@JsonSerializable()
class UserDetails {
  @JsonKey(name: 'user_id_PK')
  int? userIdPK;
  @JsonKey(name: 'devices_id_FK')
  dynamic devicesIdFK;
  @JsonKey(name: 'organization_id_FK')
  int? organizationIdFK;
  @JsonKey(name: 'designation_id_FK')
  dynamic designationIdFK;
  dynamic gender;
  @JsonKey(name: 'mobile_number')
  String? mobileNumber;
  @JsonKey(name: 'country_code')
  String? countryCode;
  @JsonKey(name: 'date_of_birth')
  dynamic dateOfBirth;
  @JsonKey(name: 'pan_card_number')
  dynamic panCardNumber;
  @JsonKey(name: 'personal_email')
  dynamic personalEmail;
  String? email;
  @JsonKey(name: 'emergency_contact_no')
  dynamic emergencyContactNo;
  @JsonKey(name: 'mother_name')
  dynamic motherName;
  @JsonKey(name: 'father_name')
  dynamic fatherName;
  @JsonKey(name: 'permanent_address')
  dynamic permanentAddress;
  @JsonKey(name: 'current_address')
  dynamic currentAddress;
  @JsonKey(name: 'is_active')
  dynamic isActive;
  @JsonKey(name: 'is_blocked')
  dynamic isBlocked;
  @JsonKey(name: 'is_pivot_account')
  dynamic isPivotAccount;
  String? password;
  @JsonKey(name: 'is_verified')
  dynamic isVerified;
  @JsonKey(name: 'device_ids')
  dynamic deviceIds;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  int? role;
  @JsonKey(name: 'department_id_FK')
  int? departmentIdFK;
  @JsonKey(name: 'rfid_tag')
  dynamic rfidTag;
  @JsonKey(name: 'fingerprint_id')
  dynamic fingerprintId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  dynamic updatedAt;
  @JsonKey(name: 'user_profile_img')
  String? userProfileImg;
  @JsonKey(name: 'device_name')
  dynamic deviceName;
  @JsonKey(name: 'model_no')
  dynamic modelNo;
  @JsonKey(name: 'organization_name')
  String? organizationName;
  @JsonKey(name: 'designation_name')
  dynamic designationName;

  UserDetails(
      {this.userIdPK,
      this.devicesIdFK,
      this.organizationIdFK,
      this.designationIdFK,
      this.gender,
      this.mobileNumber,
      this.countryCode,
      this.dateOfBirth,
      this.panCardNumber,
      this.personalEmail,
      this.email,
      this.emergencyContactNo,
      this.motherName,
      this.fatherName,
      this.permanentAddress,
      this.currentAddress,
      this.isActive,
      this.isBlocked,
      this.isPivotAccount,
      this.password,
      this.isVerified,
      this.deviceIds,
      this.firstName,
      this.lastName,
      this.role,
      this.departmentIdFK,
      this.rfidTag,
      this.fingerprintId,
      this.createdAt,
      this.updatedAt,
      this.userProfileImg,
      this.deviceName,
      this.modelNo,
      this.organizationName,
      this.designationName});

  factory UserDetails.fromJson(Map<String, dynamic> json) => _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);

}
