/*
* @author: zongjian
* @createTime: 2023/6/12 16:30
* @description: 
*/
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';

class TextInput extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final String icon;
  final bool? obscureText;

  const TextInput({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        color: Get.isDarkMode ? AppColors.dark2 : AppColors.greyscale50,
      ),
      child: TextFormField(
        controller: controller,
        style: AppTextStyles.bodyMediumSemiBold?.copyWith(
          color: Get.isDarkMode ? AppColors.white : AppColors.greyscale900,
        ),
        obscureText: obscureText??false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: AppTextStyles.bodyMediumRegular?.copyWith(
            color: AppColors.greyscale500
          ),
          contentPadding: EdgeInsets.all(15.sp),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.0),
            borderRadius: BorderRadius.circular(12.sp),
          ),
          // filled: true,
          // fillColor: Get.isDarkMode ? AppColors.dark2 : AppColors.greyscale50,
          // focusColor: AppColors.transparentRed,
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: 15.sp, left: 5.sp, right: 0, bottom: 15.sp),
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(Get.isDarkMode ? AppColors.white : AppColors.greyscale900, BlendMode.srcIn),
              width: 20.w,
            ),
          ),
        ),
      ),
    );
  }
}