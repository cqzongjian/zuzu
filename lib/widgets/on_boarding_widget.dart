/*
* @author: zongjian
* @createTime: 2023/6/9 15:19
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/dimensions.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key,
    required this.image,
    required this.text,
    this.width
  });

  final String image;
  final String text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 80.h,),
          SvgPicture.asset(
              image,
              width: width
          ),
          SizedBox(height: 20.h,),
          Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            // color: AppColors.greyscale900
          ),),
        ],
      ),
    );
  }
}