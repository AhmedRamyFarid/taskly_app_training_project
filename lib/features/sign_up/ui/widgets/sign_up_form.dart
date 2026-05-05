import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly_app/core/helpers/input_validation_rules.dart';
import 'package:taskly_app/core/helpers/spacing.dart';
import 'package:taskly_app/core/widgets/app_text_form_field.dart';
import 'package:taskly_app/core/widgets/security_requirements.dart';
import 'package:taskly_app/features/sign_up/logic/cubit/signup_cubit.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            label: "Full Name".toUpperCase(),
            hintText: "Enter your full name",
            keyboardType: TextInputType.name,
            controller: context.read<SignUpCubit>().nameController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Name is required';
              }
              final name = value.trim();
              if (!NameRules.hasValidLength(name)) {
                return 'Name must be 3–50 characters';
              }
              if (!NameRules.isValidCharacters(name)) {
                return 'Name must be A–Z, a–z and spaces';
              }
              return null;
            },
          ),
          verticalSpace(24),
          AppTextFormField(
            label: "Email".toUpperCase(),
            hintText: "yourname@company.com",
            keyboardType: TextInputType.emailAddress,
            controller: context.read<SignUpCubit>().emailController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Email is required';
              }
              final email = value.trim();
              if (!EmailRules.isValidEmail(email)) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          verticalSpace(24),
          AppTextFormField(
            label: "Job Title".toUpperCase(),
            hintText: "e.g. Project Manager",
            controller: context.read<SignUpCubit>().jobTitleController,
          ),
          verticalSpace(24),
          AppTextFormField(
            label: "Password".toUpperCase(),
            hintText: "Min. 8 characters",
            keyboardType: TextInputType.visiblePassword,
            controller: context.read<SignUpCubit>().passwordController,
            showToggleIcon: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              if (!PasswordRules.hasValidLength(value) ||
                  !PasswordRules.hasUpperAndLowerCase(value) ||
                  !PasswordRules.hasDigit(value) ||
                  !PasswordRules.hasSpecialCharacter(value)) {
                return 'Password does not meet security requirements';
              }
              if (!PasswordRules.hasNoSpaces(value)) {
                return 'Password must not contain spaces';
              }
              return null;
            },
          ),
          verticalSpace(14),
          ValueListenableBuilder(
            valueListenable: context.read<SignUpCubit>().passwordController,
            builder: (context, value, _) {
              return SecurityRequirements(
                hasValidLength: PasswordRules.hasValidLength(value.text),
                hasUpperAndLower: PasswordRules.hasUpperAndLowerCase(
                  value.text,
                ),
                hasDigit: PasswordRules.hasDigit(value.text),
                hasSpecialChar: PasswordRules.hasSpecialCharacter(value.text),
              );
            },
          ),
          verticalSpace(24),
          AppTextFormField(
            label: "Confirm Password".toUpperCase(),
            hintText: "Repeat your password",
            keyboardType: TextInputType.visiblePassword,
            controller: context.read<SignUpCubit>().confirmPasswordController,
            showToggleIcon: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value !=
                  context.read<SignUpCubit>().passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
