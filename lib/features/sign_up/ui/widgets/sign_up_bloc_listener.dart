import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly_app/core/routing/routes.dart';
import 'package:taskly_app/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:taskly_app/features/sign_up/logic/cubit/signup_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          success: (data) {
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
          },
          error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error), backgroundColor: Colors.red),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
