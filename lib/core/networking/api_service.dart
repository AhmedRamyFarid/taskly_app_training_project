import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:taskly_app/core/networking/api_constants.dart';
import 'package:taskly_app/features/login/data/models/auth_response.dart';
import 'package:taskly_app/features/login/data/models/login_request_body.dart';
import 'package:taskly_app/features/signup/data/models/signup_request_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<AuthResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<AuthResponse> signup(@Body() SignUpRequestBody signUpRequestBody);
}
