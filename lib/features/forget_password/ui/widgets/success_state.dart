import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskly_app/core/helpers/font_weight.dart';
import 'package:taskly_app/core/helpers/spacing.dart';
import 'package:taskly_app/core/theming/app_colors.dart';

class SuccessState extends StatelessWidget {
  const SuccessState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x4D82F9BE),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/svgs/check.svg', height: 20.h, width: 20.w),
              horizontalSpace(12.w),
              Text(
                'If an account exists with this email, we\'ve sent\n a password reset link.',
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeightHelper.medium,
                  color: Color(0xFF005235),
                ),
              ),
            ],
          ),
          verticalSpace(16),
          Divider(color: Color(0x1A005235), height: 1.h),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Didn't Receive Email?".toUpperCase(),
                style: GoogleFonts.inter(
                  fontSize: 11.sp,
                  letterSpacing: 0.6.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: Color(0x99005235),
                ),
              ),
              Text(
                "Resend in 05:00".toUpperCase(),
                style: GoogleFonts.inter(
                  fontSize: 11.sp,
                  letterSpacing: 0.6.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
