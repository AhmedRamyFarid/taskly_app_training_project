import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskly_app/core/helpers/font_weigt.dart';
import 'package:taskly_app/core/helpers/spacing.dart';
import 'package:taskly_app/core/theming/app_colors.dart';

class HeaderForSignupAndLogin extends StatelessWidget {
  const HeaderForSignupAndLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w, left: 24.w),
      child: SizedBox(
        height: 80.h,
        child: Row(
          children: [
            SvgPicture.asset('assets/Icon.svg', height: 20.h, width: 18.w),
            horizontalSpace(7),
            Text(
              'Taskly'.toUpperCase(),
              style: GoogleFonts.inter(
                fontSize: 20.sp,
                letterSpacing: -0.5.w,
                fontWeight: FontWeightHelper.bold,
                color: AppColors.one,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
