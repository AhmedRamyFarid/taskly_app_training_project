import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskly_app/core/helpers/spacing.dart';
import 'package:taskly_app/core/widgets/app_text_button.dart';
import 'package:taskly_app/core/widgets/header_for_signup_and_login.dart';
import 'package:taskly_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:taskly_app/features/signup/logic/cubit/signup_state.dart';
import 'package:taskly_app/features/signup/ui/widgets/already_have_an_account.dart';
import 'package:taskly_app/features/signup/ui/widgets/create_your_workspace.dart';
import 'package:taskly_app/features/signup/ui/widgets/sign_up_bloc_listener.dart';
import 'package:taskly_app/features/signup/ui/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderForSignupAndLogin(),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        verticalSpace(32),
                        const CreateYourWorkspace(),
                        verticalSpace(40),
                        const SignUpForm(),
                        verticalSpace(24),
                        BlocBuilder<SignUpCubit, SignUpState>(
                          builder: (context, state) {
                            final bool isLoading = state is Loading;
                            return AppTextButton(
                              text: "Create Account",
                              isLoading: isLoading,
                              isEnabled: !isLoading,
                              onPressed: () {
                                final cubit = context.read<SignUpCubit>();
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.emitSignupStates();
                                }
                              },
                            );
                          },
                        ),
                        verticalSpace(63.5),
                        const AlreadyHaveAnAccount(),
                        verticalSpace(42.5),
                        const SignUpBlocListener(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
