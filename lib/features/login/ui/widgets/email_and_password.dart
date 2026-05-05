import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskly_app/core/helpers/extensions.dart';
import 'package:taskly_app/core/helpers/spacing.dart';
import 'package:taskly_app/core/routing/routes.dart';
import 'package:taskly_app/core/widgets/app_text_form_field.dart';
import 'package:taskly_app/features/login/logic/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  late TextEditingController passWordController;

  @override
  void initState() {
    super.initState();
    passWordController = context.read<LoginCubit>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            label: "Email Address".toUpperCase(),
            hintText: "Enter your email",
            keyboardType: TextInputType.emailAddress,
            controller: context.read<LoginCubit>().emailController,
            suffixIcon: Icon(
              Icons.email_outlined,
              size: 20.w,
              color: const Color(0xFF737685),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          verticalSpace(24),
          AppTextFormField(
            label: "Password".toUpperCase(),
            hintText: "Enter password",
            keyboardType: TextInputType.visiblePassword,
            isObscureText: isObscureText,
            controller: context.read<LoginCubit>().passwordController,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.lock_outline : Icons.lock_open_outlined,
                size: 20.w,
                color: const Color(0xFF737685),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
            onForgotPassword: () {
              context.pushNamed(Routes.forgotPasswordScreen);
            },
          ),
        ],
      ),
    );
  }
}
