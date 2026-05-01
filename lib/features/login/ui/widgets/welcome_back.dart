import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskly_app/core/helpers/font_weigt.dart';
import 'package:taskly_app/core/theming/app_colors.dart';

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome Back',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 24.sp,
            letterSpacing: -0.6.w,
            fontWeight: FontWeightHelper.semiBold,
            color: AppColors.one,
          ),
        ),
        Text(
          'Please enter your details to access\nyour workspace',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeightHelper.regular,
            color: AppColors.two,
          ),
        ),
      ],
    );
  }
}
