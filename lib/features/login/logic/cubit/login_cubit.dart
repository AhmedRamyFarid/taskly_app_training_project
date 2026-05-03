import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:taskly_app/core/networking/api_result.dart';
import 'package:taskly_app/features/login/data/models/login_request_body.dart';
import 'package:taskly_app/features/login/data/repos/login_repo.dart';
import 'package:taskly_app/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> emitLoginStates() async {
    emit(const LoginState.loading());

    final body = LoginRequestBody(
      email: emailController.text,
      password: passwordController.text,
    );

    try {
      final response = await _loginRepo.login(body);

      response.when(
        success: (loginResponse) {
          emit(LoginState.success(loginResponse));
        },
        failure: (error) {
          emit(LoginState.error(error: error.message ?? ''));
        },
      );
    } catch (e) {
      emit(LoginState.error(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
