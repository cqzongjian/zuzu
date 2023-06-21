/*
* @author: zongjian
* @createTime: 2023/6/9 17:28
* @description: 
*/
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zuzu/controller/lets_in_controller.dart';
import 'package:zuzu/routes/routes.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';
import 'package:zuzu/themes/dimensions.dart';
import 'package:zuzu/themes/typography.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/utils/strings.dart';
import 'package:zuzu/views/lets_in/widgets/google_button.dart';
import 'package:zuzu/widgets/button.dart';
import 'package:zuzu/widgets/login_button.dart';
import 'package:zuzu/widgets/login_divider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LetsInScreen extends StatelessWidget {
  LetsInScreen({Key? key}) : super(key: key);

  final controller = Get.put(LetsInController());

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
            Text(Strings.letsIn, style: AppTextStyles.heading1,),
            SizedBox(height: 20.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoginButton(
                  icon: Assets.facebook,
                  text: Strings.continueWithFacebook.tr,
                  onClick: () {

                  }
                ),
                SizedBox(height: 10.h,),
                // const GoogleButton(),
                LoginButton(
                  icon: Assets.google,
                  text: Strings.continueWithGoogle.tr,
                  onClick: () {
                    controller.signInWithGoogle(context);
                  }
                ),
                SizedBox(height: 10.h,),
                LoginButton(
                  icon: Assets.apple,
                  iconColor: Get.isDarkMode ? AppColors.white : AppColors.black,
                  text: Strings.continueWithApple.tr,
                  onClick: () {

                  }
                ),
              ],
            ),

            SizedBox(height: 20.h,),
            const LoginDivider(text: "or"),

            SizedBox(height: 20.h,),
            Button(
              onClick: () => Get.toNamed(Routes.signInScreen),
              text: Strings.signInWithPassword.tr,
            ),

            SizedBox(height: 20.h,),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: Strings.dontHaveAnAccount.tr,
                  style: AppTextStyles.bodyMediumRegular
                ),
                TextSpan(
                  text: '  ${Strings.signUp.tr}',
                  style: AppTextStyles.bodyMediumSemiBold?.copyWith(
                    color: AppColors.primaryColor
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed(Routes.signUpScreen),
                ),
              ]),
            ),
          ],
        ),
      )
    );
  }

}