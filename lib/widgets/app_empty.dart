/*
* @author: zongjian
* @createTime: 2023/6/15 13:36
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zuzu/themes/app_text_styles.dart';

class AppEmpty extends StatelessWidget {
  const AppEmpty({
    Key? key,
    this.height,
  }) : super(key: key);

  final double? height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, size) {
        return IgnorePointer(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: height ?? size.maxHeight * 0.25,
              ),
              Icon(
                Icons.playlist_add_check_circle_outlined,
                size: 88.sp,
              ),
              SizedBox(height: 8.h),
              Text(
                '暂无数据',
                style: AppTextStyles.bodyMediumMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
