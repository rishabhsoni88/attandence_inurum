import 'package:attandenceapp/data/attendance_response.dart';
import 'package:attandenceapp/data/forget_response.dart';
import 'package:attandenceapp/data/holiday_response.dart';
import 'package:attandenceapp/data/login_response.dart';
import 'package:attandenceapp/data/user_data_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://attendance.inurum.com/api/')
abstract class ApiClient {
  factory ApiClient() {
    Dio dio = Dio(BaseOptions(
      contentType: "application/json",
      receiveTimeout: const Duration(milliseconds: 30000),
      connectTimeout: const Duration(milliseconds: 30000),
    ));

    dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
    return _ApiClient(dio);
  }

  @GET("holiday")
  Future<HolidayResponse> holidayList();

  @GET("attendance?userId=7&date=2025-02-10")
  Future<AttendanceResponse> attandenceData();

  @POST("auth/login")
  Future<LoginResponse> userLogin(
    // @Part(name: 'identity') String identity,
    // @Part(name: 'password') String password,
    @Body() Map<String, dynamic> requestBody,
  );

  @POST("users/forget_passwrd")
  Future<ForgetResponse> forgetPassword(
    // @Part(name: 'identity') String identity,
    // @Part(name: 'password') String password,
    @Body() Map<String, dynamic> requestBody,
  );

  @GET("users/{Id}")
  Future<UserDataResponse> userData(
    @Path('Id') int? userId,
  );
}
