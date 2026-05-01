import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly_app/core/routing/routes.dart';
import 'package:taskly_app/features/login/logic/cubit/login_cubit.dart';
import 'package:taskly_app/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          success: (data) {
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
