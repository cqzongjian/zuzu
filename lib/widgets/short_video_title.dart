/*
* @author: zongjian
* @createTime: 2023/6/14 14:31
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/widgets/app_image.dart';
import 'package:zuzu/widgets/rotate_cd_widget.dart';

class ShortVideoTitle extends StatelessWidget {
  const ShortVideoTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 30.w,
      // right: 160.w,
      bottom: 50.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  AppImage(
                    "https://cqsmt-img.oss-cn-chengdu.aliyuncs.com/Upload/Image/Icon/2208180511095175506.jpg",
                    // "https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9",
                    width: 60.0,
                    height: 60.0,
                    radius: 30.0,
                  ),
                  Positioned(
                    top: 45.0,
                    left: 45.0,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(2)
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.add,
                          color: AppColors.white,
                        size: 12,
                      ),
                    )
                  ),
                ],
              ),
              SizedBox(width: 10.w,),
              Column(
                children: [
                  Text("Jenny Wilson", style: AppTextStyles.heading6?.copyWith(
                      fontWeight: FontWeight.w700
                  ),),
                  SizedBox(height: 3.h,),
                  Text("Actress & Singer", style: AppTextStyles.bodyMediumMedium,)
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h,),
          Text(
            title,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodyMediumMedium,
          ),
          SizedBox(height: 15.h,),
          _buildMusicSong(),
          SizedBox(height: 30.h,),
        ],
      ),
    );
  }

  Widget _buildMusicSong() {
    return Row(
      children: [
        const RotateCDWidget(),
        SizedBox(width: 10.w,),
        const AppImage(Assets.musicSong,
          width: 16,
          height: 16,
          color: AppColors.white,
        ),
        SizedBox(width: 10.w,),
        Text("Favorite Girl by Justin Bieber", style: AppTextStyles.bodySmallSemiBold,)
      ],
    );
  }
}
