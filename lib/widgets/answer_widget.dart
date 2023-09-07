import 'package:expert_system_app/resources/context_ext.dart';
import 'package:expert_system_app/resources/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({
    super.key,
    required this.answer,
    required this.isSelected,
    required this.onPressed,
  });

  final String answer;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.w),
          ),
          side: BorderSide(
            color: isSelected ? AppColors.blue : Colors.black,
            width: 1.5,
          ),
        ),
        child: Text(
          answer.splitCamelCase(),
          style: context.bodyMedium.copyWith(
            fontSize: 18.sp,
            color: isSelected ? AppColors.blue : Colors.black,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
