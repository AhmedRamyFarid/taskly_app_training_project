import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskly_app/core/networking/api_result.dart';
import 'package:taskly_app/features/login/data/models/login_response.dart';
import 'package:taskly_app/features/signup/data/models/signup_request_body.dart';
import 'package:taskly_app/features/signup/data/repos/signup_repo.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _repo;

  SignUpCubit(this._repo) : super(const SignUpState.initial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final jobTitleController = TextEditingController();

  Future<void> emitSignupStates() async {
    if (!formKey.currentState!.validate()) return;
    emit(const SignUpState.loading());

    try {
      final body = SignUpRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        userData: SignUpUserData(
          name: nameController.text.trim(),
          jobTitle: jobTitleController.text.trim(),
        ),
      );

      final result = await _repo.signup(body);

      result.when(
        success: (data) {
          emit(SignUpState.success(data));
        },
        failure: (error) {
          emit(SignUpState.error(error: error.message ?? '',));
        },
      );
    } catch (e) {
      emit(SignUpState.error(error: e.toString()));
    }

    @override
    // ignore: unused_element
    Future<void> close() {
      nameController.dispose();
      emailController.dispose();
      passwordController.dispose();
      confirmPasswordController.dispose();
      jobTitleController.dispose();
      return super.close();
    }
  }
}
