/*
* @author: zongjian
* @createTime: 2023/6/9 13:44
* @description: 
*/
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/dimensions.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/utils/strings.dart';
import 'package:zuzu/widgets/button.dart';
import '../controller/on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() =>
        Stack(
            alignment: Alignment.center,
            children: [
              LiquidSwipe(
                pages: controller.pages,
                liquidController: controller.liquidController,
                onPageChangeCallback: controller.onPageChangeCallback,
                enableLoop: false,
              ),
              Positioned(
                bottom: 100.h,
                child: AnimatedSmoothIndicator(
                  activeIndex: controller.currentPage.value,
                  count: controller.pages.length,
                  effect: ExpandingDotsEffect(
                    dotWidth: 6.sp,
                    dotHeight: 6.sp,
                    radius: 12.sp,
                    activeDotColor: Theme.of(context).primaryColor,
                    dotColor: Theme.of(context).indicatorColor,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Button(
                    onClick: controller.buttonClick,
                    text: controller.currentPage.value == 2 ? Strings.getStarted.tr : Strings.next.tr,
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

}