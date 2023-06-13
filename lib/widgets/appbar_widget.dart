/*
* @author: zongjian
* @createTime: 2023/6/6 14:43
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zuzu/themes/app_text_styles.dart';

import '../../utils/assets.dart';
import '../../themes/app_colors.dart';
import '../../themes/dimensions.dart';

// ignore_for_file: deprecated_member_use
class AppBarWidget extends AppBar {
  final bool moreVisible, actionVisible;
  final String? appTitle,buttonText;
  final VoidCallback? onPressed, onBackClick;
  AppBarWidget(
      {super.key,
        this.appTitle = "",
        this.onBackClick,
        this.moreVisible = false,
        this.actionVisible = false,
        this.buttonText = '',
        this.onPressed})
      : super(
    backgroundColor: Colors.transparent,
    title: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          appTitle?.tr??"",
          style: AppTextStyles.heading4?.copyWith(
            fontWeight: FontWeight.w700,
            color: Get.isDarkMode ? AppColors.white : AppColors.greyscale900,
          ),
        ),
      ],
    ),
    elevation: 0,
    automaticallyImplyLeading: false,
    centerTitle: false,
    actions: actionVisible ? [
      Visibility(
        visible: moreVisible,
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.more_vert,
                color: Get.isDarkMode ? AppColors.white : AppColors.greyscale900
            )),
      ),

      Visibility(
        visible: !moreVisible,
        child: TextButton(
          onPressed: onPressed,
          child: Text(buttonText?.tr??"",
            style: TextStyle(
              color: Get.isDarkMode ? AppColors.white : AppColors.greyscale900
            ),
          )),
      ),
    ] : [],
    leading: IconButton(
        onPressed: () {
          if (onBackClick == null) {
            Get.back();
          } else {
            onBackClick.call();
          }
        },
        icon: SvgPicture.asset(
          Assets.arrowLeft,
          width: 24.sp,
          colorFilter: ColorFilter.mode(Get.isDarkMode ? AppColors.white : AppColors.greyscale900, BlendMode.srcIn)
        )),
  );
}
