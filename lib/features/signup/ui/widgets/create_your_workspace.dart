import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskly_app/core/helpers/font_weigt.dart';
import 'package:taskly_app/core/helpers/spacing.dart';
import 'package:taskly_app/core/theming/app_colors.dart';

class CreateYourWorkspace extends StatelessWidget {
  const CreateYourWorkspace({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create your workspace',
          style: GoogleFonts.inter(
            fontSize: 28.sp,
            letterSpacing: -0.8.w,
            fontWeight: FontWeightHelper.semiBold,
            color: AppColors.one,
          ),
        ),
        verticalSpace(5),
        Text(
          'Join the curated environment for institutional trust and task precision.',
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeightHelper.regular,
            color: Color(0xFF434654),
          ),
        ),
      ],
    );
  }
}
