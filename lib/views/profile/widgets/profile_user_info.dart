/*
* @author: zongjian
* @createTime: 2023/6/15 15:53
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';
import 'package:zuzu/themes/dimensions.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/views/profile/widgets/profile_app_bar.dart';
import 'package:zuzu/views/profile/widgets/profile_tab_bar.dart';
import 'package:zuzu/views/profile/widgets/profile_tab_view.dart';
import 'package:zuzu/widgets/app_bottom_bar.dart';
import 'package:zuzu/widgets/app_image.dart';
import 'package:zuzu/widgets/custom_sliver_persistent_header_delegate.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildAvatar(),
            Text("@andrew_aisnley", style: AppTextStyles.heading5?.copyWith(
              fontWeight: FontWeight.w700,
            ),),
            Text("Designer & Videographer", style: AppTextStyles.bodyMediumMedium?.copyWith(
                height: 2
            ),),
            _buildNumRow(context),

            _buildEditProfileButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: Stack(
        children: [
          AppImage(
            "https://cqsmt-img.oss-cn-chengdu.aliyuncs.com/Upload/Image/Icon/2208180511095175506.jpg",
            // "https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9",
            width: 120.0,
            height: 120.0,
            radius: 60.0,
          ),
          Positioned(
              top: 95.0,
              left: 95.0,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8)
                ),
                alignment: Alignment.center,
                child: Icon(Icons.edit,
                  color: AppColors.white,
                  size: 18,
                ),
              )
          ),
        ],
      ),
    );
  }

  _buildNumRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNumItem(context, label: "Posts", value: "247"),
          _buildNumItem(context, label: "Followers", value: "368K"),
          _buildNumItem(context, label: "Following", value: "387"),
          _buildNumItem(context, label: "Likes", value: "3.7M", showDivider: false),
        ],
      ),
    );
  }

  Widget _buildNumItem(BuildContext context, {
    required String label,
    required String value,
    bool showDivider = true,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: showDivider ? Border(
          right: BorderSide(width: 1, color: Theme.of(context).colorScheme.onSecondary),
        ) : null,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          Text(value, style: AppTextStyles.heading4?.copyWith(
              fontWeight: FontWeight.w700,
              height: 1.5
          ),),
          Text(label, style: AppTextStyles.bodyMediumMedium?.copyWith(
              height: 2
          ),)
        ],
      ),
    );
  }

  Widget _buildEditProfileButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        side: BorderSide(width: 2, color: AppColors.primaryColor),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppImage(Assets.chat, width: 20, color: AppColors.primaryColor,),
          SizedBox(width: 5.w,),
          Text('Edit Profile', style: AppTextStyles.bodyXLargeBold,),
        ],
      ),
    );
  }

}