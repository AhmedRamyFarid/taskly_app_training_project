import 'package:dio/dio.dart';
import 'package:taskly_app/core/networking/api_error_handler.dart';
import 'package:taskly_app/core/networking/api_result.dart';
import 'package:taskly_app/core/networking/api_service.dart';
import 'package:taskly_app/features/login/data/models/auth_response.dart';
import 'package:taskly_app/features/login/data/models/login_request_body.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<AuthResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } on DioException catch (error) {
      final apiError = ErrorHandler.from(error).failure;
      return ApiResult.failure(apiError);
    } catch (error) {
      return ApiResult.failure(DataSource.defaultError.getFailure());
    }
  }
}
