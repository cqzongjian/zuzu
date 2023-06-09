/*
* @author: zongjian
* @createTime: 2023/6/9 17:28
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/dimensions.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/utils/strings.dart';

class LetsInScreen extends StatelessWidget {
  LetsInScreen({Key? key}) : super(key: key);

  // final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.h,),
            SvgPicture.asset(
                Assets.letsIn,
                width: 237.w
            ),
            SizedBox(height: 20.h,),
            const Text(Strings.letsIn),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyscale200),
                      borderRadius: BorderRadius.circular(16.sp)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          Assets.facebook,
                          width: 24.w
                      ),
                      const Text(Strings.continueWithFacebook)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

}