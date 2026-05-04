import 'package:dio/dio.dart';
import 'package:taskly_app/core/networking/api_error_handler.dart';
import 'package:taskly_app/core/networking/api_result.dart';
import 'package:taskly_app/core/networking/api_service.dart';
import 'package:taskly_app/features/signup/data/models/signup_request_body.dart';
import 'package:taskly_app/features/login/data/models/auth_response.dart';

class SignUpRepo {
  final ApiService _apiService;

  SignUpRepo(this._apiService);

  Future<ApiResult<AuthResponse>> signup(SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await _apiService.signup(signUpRequestBody);
      return ApiResult.success(response);
    } on DioException catch (error) {
      final apiError = ErrorHandler.from(error).failure;
      return ApiResult.failure(apiError);
    } catch (error) {
      return ApiResult.failure(DataSource.defaultError.getFailure());
    }
  }
}
