/*
* @author: zongjian
* @createTime: 2023/6/15 13:49
* @description: 
*/
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zuzu/model/video_params_model.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/widgets/app_gesture_detector.dart';
import 'package:zuzu/widgets/app_image.dart';

class VideoCover extends StatelessWidget {
  const VideoCover({
    Key? key,
    required this.id,
    required this.cover,
    required this.count,
    required this.videoUrl,
    this.isReset = false,
  }) : super(key: key);

  final int id;
  final String cover;
  final String count;
  final String videoUrl;
  final bool isReset;

  void onTap() {
    final arguments = VideoParams(
      id: id,
      url: videoUrl,
    );

    if (isReset) {
      Get.offNamed('/movie_details?tagId=$id', arguments: arguments);
    } else {
      Get.toNamed('/movie_details?tagId=$id', arguments: arguments);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppGestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCover(),
        ],
      ),
    );
  }

  Widget _buildCover() {
    return AspectRatio(
      aspectRatio: 122 / 200,
      child: Stack(
        children: [
          AppImage(
            cover,
            width: double.infinity,
            height: double.infinity,
            radius: 10.sp,
          ),
          _buildViews(),
        ],
      ),
    );
  }

  Widget _buildViews() {
    return Positioned(
      right: 0,
      bottom: 0,
      child: Container(
        constraints: BoxConstraints(
          minWidth: 100.w,
        ),
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        // decoration: BoxDecoration(
        //   color: Colors.black45,
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(10.sp),
        //     bottomRight: Radius.circular(10.sp),
        //   ),
        // ),
        height: 30.h,
        child: Row(
          children: [
            const AppImage(Assets.play, width: 16, color: AppColors.primaryColor,),
            SizedBox(width: 5.w),
            Text(
              count,
              style: AppTextStyles.bodyXSmallSemiBold,
            ),
          ],
        ),
      ),
    );
  }

}
