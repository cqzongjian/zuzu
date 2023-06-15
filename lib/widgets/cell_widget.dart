/*
* @author: zongjian
* @createTime: 2023/6/15 16:15
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/widgets/app_image.dart';

class CellWidget extends StatelessWidget {
  const CellWidget({super.key,
    required this.icon,
    required this.label,
    this.color,
    this.value,
    this.child,
  });

  final String icon;
  final String label;
  final Color? color;
  final String? value;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Color color2 = color ?? (Get.isDarkMode ? AppColors.white : AppColors.greyscale900);
    return InkWell(
      onTap: () {},
      child: Container(
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          children: [
            AppImage(icon, width: 28, height: 28, color: color2,),
            SizedBox(width: 10.w,),
            Text(label, style: AppTextStyles.bodyXLargeSemiBold?.copyWith(
              color: color2,
            ),),
            const Spacer(),
            child ?? Row(
              children: [
                Text(value??"", style: AppTextStyles.bodyXLargeSemiBold?.copyWith(
                  color: color2,
                ),),
                SizedBox(width: 10.w,),
                AppImage(Assets.arrowRight2, width: 20, height: 20, color: color2,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}