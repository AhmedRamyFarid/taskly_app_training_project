import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskly_app/core/helpers/font_weigt.dart';
import 'package:taskly_app/core/helpers/spacing.dart';
import 'package:taskly_app/core/theming/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final VoidCallback? onForgotPassword;
  final bool showToggleIcon;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const AppTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onForgotPassword,
    this.showToggleIcon = false,
    this.isObscureText = false,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (formFieldState) {
        final bool hasError = formFieldState.hasError;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.inter(
                      fontSize: 11.sp,
                      letterSpacing: 0.55.w,
                      fontWeight: FontWeightHelper.bold,
                      color: hasError
                          ? AppColors.error
                          : const Color(0xFF434654),
                    ),
                  ),
                  if (onForgotPassword != null)
                    GestureDetector(
                      onTap: onForgotPassword,
                      child: Text(
                        "Forgot?",
                        style: GoogleFonts.inter(
                          fontSize: 11.sp,
                          fontWeight: FontWeightHelper.bold,
                          color: const Color(0xFF003D9B),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            verticalSpace(6),
            TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: isObscureText ?? false,
              onChanged: formFieldState.didChange,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: hasError
                    ? const Color(0xFFFFDAD6)
                    : AppColors.surfaceHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 18.h,
                ),
                hintText: hintText,
                hintStyle: GoogleFonts.inter(
                  color: hasError
                      ? const Color(0xFF93000A)
                      : const Color(0xFF737685),
                  fontSize: 16.sp,
                ),
                suffixIcon: suffixIcon,
                errorText: formFieldState.errorText,
              ),
              validator: validator,
            ),
          ],
        );
      },
    );
  }
}
