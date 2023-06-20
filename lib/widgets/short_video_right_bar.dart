/*
* @author: zongjian
* @createTime: 2023/6/14 13:36
* @description: 
*/
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/widgets/app_gesture_detector.dart';
import 'package:zuzu/widgets/app_image.dart';

class ShortVideoRightBar extends StatelessWidget {
  const ShortVideoRightBar({
    Key? key,
    required this.isLike,
    required this.likeCount,
    required this.shareCount,
    // required this.adData,
    this.likeOnTap,
    this.likeOffTap,
    required this.isCollect,
    required this.collectNum,
    this.collectTap,
  }) : super(key: key);

  final bool isLike;
  final String likeCount;
  final String shareCount;
  // final CarouselData adData;
  final void Function()? likeOnTap;
  final void Function()? likeOffTap;
  final bool isCollect;
  final String collectNum;
  final void Function()? collectTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 15.w,
      bottom: 100.h,
      child: Column(
        children: [
          _buildFlagButton(),
          SizedBox(height: 20.h),
          _buildLikeButton(),
          SizedBox(height: 20.h),
          _buildCommentButton(),
          SizedBox(height: 20.h),
          _buildCollectButton(),
          SizedBox(height: 20.h),
          _buildShareButton(),
        ],
      ),
    );
  }

  Widget _buildFlagButton() {
    return AppGestureDetector(
      onTap: () {},
      child: Column(
        children: [
          AppImage(
            Assets.reportFlag,
            width: 24,
            color: isLike ? AppColors.primaryColor : AppColors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildLikeButton() {
    return AppGestureDetector(
      onTap: isLike ? likeOffTap : likeOnTap,
      child: Column(
        children: [
          AppImage(
            Assets.heart,
            width: 36,
            color: isLike ? AppColors.primaryColor : AppColors.white,
          ),
          SizedBox(height: 3.h),
          Text(
            likeCount,
            style: AppTextStyles.bodySmallMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildCommentButton() {
    return AppGestureDetector(
      onTap: isLike ? likeOffTap : likeOnTap,
      child: Column(
        children: [
          AppImage(
            Assets.chat,
            width: 36,
            color: AppColors.white,
          ),
          SizedBox(height: 3.h),
          Text(
            likeCount,
            style: AppTextStyles.bodySmallMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildShareButton() {
    return AppGestureDetector(
      onTap: () => Get.toNamed('/invite_code'),
      child: Column(
        children: [
          AppImage(
            Assets.shareForward,
            width: 36,
            color: isLike ? AppColors.primaryColor : AppColors.white,
          ),
          SizedBox(height: 3.h),
          Text(
            shareCount,
            style: AppTextStyles.bodySmallMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildCollectButton() {
    return AppGestureDetector(
      onTap: collectTap,
      child: Column(
        children: [
          AppImage(
            Assets.bookmark,
            width: 36,
            color: isCollect ? AppColors.primaryColor : AppColors.white,
          ),
          SizedBox(height: 6.h),
          Text(
            collectNum,
            style: AppTextStyles.bodySmallMedium,
          ),
        ],
      ),
    );
  }
}
