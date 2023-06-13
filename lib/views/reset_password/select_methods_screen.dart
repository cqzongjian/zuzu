/*
* @author: zongjian
* @createTime: 2023/6/13 14:10
* @description: 
*/
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zuzu/routes/routes.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';
import 'package:zuzu/themes/dimensions.dart';
import 'package:zuzu/themes/typography.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/utils/strings.dart';
import 'package:zuzu/widgets/appbar_widget.dart';
import 'package:zuzu/widgets/button.dart';
import 'package:zuzu/widgets/login_button.dart';
import 'package:zuzu/widgets/login_divider.dart';

class SelectMethodsScreen extends StatelessWidget {
  SelectMethodsScreen({Key? key}) : super(key: key);

  // final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          appTitle: Strings.forgotPassword.tr
        ),
        body: Padding(
          padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.h,),
              SvgPicture.asset(
                Assets.forget,
                width: 250,
                height: 244,
              ),
              SizedBox(height: 20.h,),
              Text(Strings.selectResetMethods, style: AppTextStyles.bodyXLargeMedium,),

              _buildCard(),
              _buildCard(),

              SizedBox(height: 20.h,),
              Button(
                onClick: () => Get.toNamed(Routes.signInScreen),
                text: Strings.continueStr.tr,
              ),

            ],
          ),
        )
    );
  }
  
  Widget _buildIcon(String icon) => Container(
    width: 80.w,
    height: 80.w,
    decoration: BoxDecoration(
        color: AppColors.transparentRed.withOpacity(0.08),
        borderRadius: BorderRadius.circular(40.w)
    ),
    alignment: Alignment.center,
    child: SvgPicture.asset(
        icon,
        colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
        width: 32.w
    ),
  );

  Widget _buildCard() => GestureDetector(
    onTap: () => Get.toNamed(Routes.typeOTPScreen),
    child: Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.primaryColor,
              width: 2
          ),
          borderRadius: BorderRadius.circular(32)
      ),
      child: Row(
        children: [
          _buildIcon(Assets.chat),
          SizedBox(width: 10.w,),
          Column(
            children: [
              Text(Strings.viaSMS, style: AppTextStyles.bodyMediumMedium,),
              SizedBox(height: 5.h,),
              Text("+1 111 ******99", style: AppTextStyles.bodyLargeBold,)
            ],
          ),
        ],
      ),
    ),
  );

}