import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:taskly_app/core/networking/api_result.dart';
import 'package:taskly_app/features/sign_up/data/models/signup_request_body.dart';
import 'package:taskly_app/features/sign_up/data/repos/signup_repo.dart';
import 'package:taskly_app/features/sign_up/logic/cubit/signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signupRepo;

  SignUpCubit(this._signupRepo) : super(const SignUpState.initial());

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final jobTitleController = TextEditingController();

  Future<void> emitSignupStates() async {
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

      final result = await _signupRepo.signup(body);

      result.when(
        success: (signupResponse) {
          emit(SignUpState.success(signupResponse));
        },
        failure: (error) {
          emit(SignUpState.error(error: error.message ?? ''));
        },
      );
    } catch (e) {
      emit(SignUpState.error(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    jobTitleController.dispose();
    return super.close();
  }
}
