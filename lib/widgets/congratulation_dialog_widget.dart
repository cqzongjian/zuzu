/*
* @author: zongjian
* @createTime: 2023/6/13 16:39
* @description: 
*/
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';
import 'package:zuzu/themes/dimensions.dart';
import 'package:zuzu/utils/assets.dart';

class CongratulationDialogWidget extends Dialog {
  final String icon;
  final String title;
  final String message;

  const CongratulationDialogWidget({Key? key,
    required this.icon,
    required this.title,
    required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(milliseconds: 3000), (timer) {
      Navigator.pop(context);
      timer.cancel();
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 340,
          height: 487,
          padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
          decoration: BoxDecoration(
            color: Get.isDarkMode ? AppColors.dark2 : AppColors.white,
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 186,
                height: 180,
              ),
              SizedBox(height: 10.h,),
              Text(title, style: AppTextStyles.heading4?.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w700
              )),
              SizedBox(height: 10.h,),
              Text(message, style: AppTextStyles.bodyLargeRegular),
              SizedBox(height: 10.h,),
              SpinKitCircle(
                color: Theme.of(context).primaryColor,
                size: 50.0,
              ),
              // TextButton(
              //   onPressed: () {
              //     //showDialog相当于push，因此自己返回需要pop
              //     Navigator.pop(context);
              //   },
              //   child: const Text('返回'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
