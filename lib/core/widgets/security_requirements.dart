import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskly_app/core/helpers/font_weigt.dart';
import 'package:taskly_app/core/helpers/spacing.dart';

class SecurityRequirements extends StatelessWidget {
  final bool hasValidLength;
  final bool hasUpperAndLower;
  final bool hasDigit;
  final bool hasSpecialChar;

  const SecurityRequirements({
    super.key,
    required this.hasValidLength,
    required this.hasUpperAndLower,
    required this.hasDigit,
    required this.hasSpecialChar,
  });

  Widget _requirementRow(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.radio_button_checked : Icons.radio_button_unchecked,
          color: isValid ? const Color(0xFF004E32) : const Color(0xFF737685),
          size: 16.sp,
        ),
        horizontalSpace(8),
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 13.sp,
            fontWeight: FontWeightHelper.regular,
            color: isValid ? const Color(0xFF041B3C) : const Color(0xFF7B879E),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Security Requirements'.toUpperCase(),
            style: GoogleFonts.inter(
              fontSize: 11.sp,
              letterSpacing: 0.55.w,
              fontWeight: FontWeightHelper.bold,
              color: const Color(0xFF434654),
            ),
          ),
          verticalSpace(6),
          _requirementRow('8 - 64 characters', hasValidLength),
          verticalSpace(4),
          _requirementRow('Uppercase & Lowercase', hasUpperAndLower),
          verticalSpace(4),
          _requirementRow('At least one digit', hasDigit),
          verticalSpace(4),
          _requirementRow('Special character (e.g. !@#\$)', hasSpecialChar),
        ],
      ),
    );
  }
}
