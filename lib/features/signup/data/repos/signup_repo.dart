import 'package:dio/dio.dart';
import 'package:taskly_app/core/networking/api_error_handler.dart';
import 'package:taskly_app/core/networking/api_result.dart';
import 'package:taskly_app/core/networking/api_service.dart';
import 'package:taskly_app/features/signup/data/models/signup_request_body.dart';
import 'package:taskly_app/features/login/data/models/login_response.dart';

class SignUpRepo {
  final ApiService _apiService;

  SignUpRepo(this._apiService);

  Future<ApiResult<LoginResponse>> signup(SignUpRequestBody body) async {
    try {
      final response = await _apiService.signup(body);
      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(ErrorHandler.from(error).failure);
    } catch (_) {
      return ApiResult.failure(ErrorHandler.from(null).failure);
    }
  }
}