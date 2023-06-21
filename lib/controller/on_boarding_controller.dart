/*
* @author: zongjian
* @createTime: 2023/6/9 13:50
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:zuzu/routes/routes.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/utils/strings.dart';
import 'package:zuzu/widgets/on_boarding_widget.dart';

class OnBoardingController extends GetxController {

  final liquidController = LiquidController();
  RxInt currentPage = 0.obs;

  final List<Widget> pages = [
    OnBoardingWidget(image: Assets.onBoardingImage1, text: Strings.onBoardingText1.tr, width: 300.w),
    OnBoardingWidget(image: Assets.onBoardingImage2, text: Strings.onBoardingText2.tr, width: 340.w),
    OnBoardingWidget(image: Assets.onBoardingImage3, text: Strings.onBoardingText3.tr, width: 300.w),
  ];

  void onPageChangeCallback(int activePageIndex) => currentPage.value = activePageIndex;

  void buttonClick() {
    if (currentPage.value == 2) {
      Get.offAndToNamed(Routes.letsInScreen);
    } else {
      currentPage.value ++;
      liquidController.jumpToPage(page: currentPage.value);
    }
  }
}
