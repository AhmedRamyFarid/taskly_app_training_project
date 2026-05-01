import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskly_app/core/helpers/extensions.dart';
import 'package:taskly_app/core/helpers/font_weigt.dart';
import 'package:taskly_app/core/routing/routes.dart';
import 'package:taskly_app/core/theming/app_colors.dart';

class DonotHaveAnAccount extends StatelessWidget {
  const DonotHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account?   ",
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeightHelper.regular,
              color: Color(0xFF434654),
            ),
          ),
          TextSpan(
            text: "Sign Up",
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeightHelper.semiBold,
              color: AppColors.primary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.signupScreen);
              },
          ),
        ],
      ),
    );
  }
}
