import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskly_app/core/helpers/font_weight.dart';
import 'package:taskly_app/core/theming/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isEnabled;
  final int radius;
  final int fontSize;
  final double height;
  final double width;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.radius = 8,
    this.fontSize = 16,
    this.height = 56,
    this.width = 342,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isEnabled ? onPressed : null,
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.r)),
        ),
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        fixedSize: WidgetStateProperty.all(Size(width.w, height.h)),
      ),
      child: isLoading
          ? const SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Text(
              text,
              style: GoogleFonts.inter(
                fontSize: fontSize.sp,
                fontWeight: FontWeightHelper.semiBold,
                color: Colors.white,
              ),
            ),
    );
  }
}
