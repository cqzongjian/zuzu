/*
* @author: zongjian
* @createTime: 2023/6/15 15:48
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zuzu/routes/routes.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/widgets/app_gesture_detector.dart';
import 'package:zuzu/widgets/app_image.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // backgroundColor: Colors.transparent,
      pinned: true,
      centerTitle: true,
      leading: Row(
        children: [
          SizedBox(width: 15.w,),
          const AppImage(Assets.addUser, width: 28, height: 28, color: AppColors.white,)
        ],
      ),
      title: _buildTitle(),
      actions: [
        AppGestureDetector(
          onTap: () => Get.toNamed(Routes.settingsScreen),
          child: const AppImage(Assets.setting, width: 28, height: 28, color: AppColors.white,),
        ),
        SizedBox(width: 15.w,),
      ],
    );
  }

  Widget _buildTitle() {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 100.w,
            child: Text(title, style: AppTextStyles.heading4?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.white
            ),
            ),
          ),
          const AppImage(Assets.arrowDown2, width: 24, color: AppColors.white,),
        ],
      ),
    );
  }
}