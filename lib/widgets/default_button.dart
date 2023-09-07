import 'package:expert_system_app/resources/context_ext.dart';
import 'package:expert_system_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.blue,
          foregroundColor: Colors.white,
          side: const BorderSide(color: AppColors.blue, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.w),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: context.bodyMedium.copyWith(
            color: Colors.white,
            fontSize: 16.5.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
