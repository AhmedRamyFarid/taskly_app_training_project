import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskly_app/core/helpers/spacing.dart';
import 'package:taskly_app/core/widgets/app_text_button.dart';
import 'package:taskly_app/core/widgets/header_for_signup_and_login.dart';
import 'package:taskly_app/features/login/logic/cubit/login_cubit.dart';
import 'package:taskly_app/features/login/logic/cubit/login_state.dart';
import 'package:taskly_app/features/login/ui/widgets/donot_have_an_account.dart';
import 'package:taskly_app/features/login/ui/widgets/email_and_password.dart';
import 'package:taskly_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:taskly_app/features/login/ui/widgets/welcome_back.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                        verticalSpace(105),
                        const WelcomeBack(),
                        verticalSpace(35),
                        const EmailAndPassword(),
                        verticalSpace(49),
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            final isLoading = state is Loading;
                            return AppTextButton(
                              text: 'Sign In',
                              isLoading: isLoading,
                              isEnabled: !isLoading,
                              onPressed: () {
                                final cubit = context.read<LoginCubit>();
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.emitLoginStates();
                                }
                              },
                            );
                          },
                        ),
                        verticalSpace(63.5),
                        const DonotHaveAnAccount(),
                        verticalSpace(42.5),
                        const LoginBlocListener(),
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
