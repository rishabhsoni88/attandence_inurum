// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      userIdPK: (json['user_id_PK'] as num?)?.toInt(),
      devicesIdFK: json['devices_id_FK'],
      organizationIdFK: (json['organization_id_FK'] as num?)?.toInt(),
      designationIdFK: json['designation_id_FK'],
      gender: json['gender'],
      mobileNumber: json['mobile_number'] as String?,
      countryCode: json['country_code'] as String?,
      dateOfBirth: json['date_of_birth'],
      panCardNumber: json['pan_card_number'],
      personalEmail: json['personal_email'],
      email: json['email'] as String?,
      emergencyContactNo: json['emergency_contact_no'],
      motherName: json['mother_name'],
      fatherName: json['father_name'],
      permanentAddress: json['permanent_address'],
      currentAddress: json['current_address'],
      isActive: json['is_active'],
      isBlocked: json['is_blocked'],
      isPivotAccount: json['is_pivot_account'],
      password: json['password'] as String?,
      isVerified: json['is_verified'],
      deviceIds: json['device_ids'],
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      role: (json['role'] as num?)?.toInt(),
      departmentIdFK: (json['department_id_FK'] as num?)?.toInt(),
      rfidTag: json['rfid_tag'],
      fingerprintId: json['fingerprint_id'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'],
      userProfileImg: json['user_profile_img'] as String?,
      deviceName: json['device_name'],
      modelNo: json['model_no'],
      organizationName: json['organization_name'] as String?,
      designationName: json['designation_name'],
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'user_id_PK': instance.userIdPK,
      'devices_id_FK': instance.devicesIdFK,
      'organization_id_FK': instance.organizationIdFK,
      'designation_id_FK': instance.designationIdFK,
      'gender': instance.gender,
      'mobile_number': instance.mobileNumber,
      'country_code': instance.countryCode,
      'date_of_birth': instance.dateOfBirth,
      'pan_card_number': instance.panCardNumber,
      'personal_email': instance.personalEmail,
      'email': instance.email,
      'emergency_contact_no': instance.emergencyContactNo,
      'mother_name': instance.motherName,
      'father_name': instance.fatherName,
      'permanent_address': instance.permanentAddress,
      'current_address': instance.currentAddress,
      'is_active': instance.isActive,
      'is_blocked': instance.isBlocked,
      'is_pivot_account': instance.isPivotAccount,
      'password': instance.password,
      'is_verified': instance.isVerified,
      'device_ids': instance.deviceIds,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'role': instance.role,
      'department_id_FK': instance.departmentIdFK,
      'rfid_tag': instance.rfidTag,
      'fingerprint_id': instance.fingerprintId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user_profile_img': instance.userProfileImg,
      'device_name': instance.deviceName,
      'model_no': instance.modelNo,
      'organization_name': instance.organizationName,
      'designation_name': instance.designationName,
    };
