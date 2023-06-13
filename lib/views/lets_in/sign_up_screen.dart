/*
* @author: zongjian
* @createTime: 2023/6/9 17:29
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
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/utils/strings.dart';
import 'package:zuzu/widgets/appbar_widget.dart';
import 'package:zuzu/widgets/button.dart';
import 'package:zuzu/widgets/login_divider.dart';
import 'package:zuzu/widgets/small_login_button.dart';
import 'package:zuzu/widgets/text_input.dart';

class SignUpScreen extends StatelessWidget {

  SignUpScreen({Key? key}) : super(key: key);

  final controller = Get.put(LetsInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
          padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30.h,),
              Text(Strings.createYourAccount.tr, style: AppTextStyles.heading1,),

              SizedBox(height: 30.h,),
              TextInput(
                controller: controller.emailController,
                hint: Strings.email.tr,
                icon: Assets.message
              ),
              SizedBox(height: 15.h,),
              TextInput(
                controller: controller.passwordController,
                hint: Strings.password.tr,
                icon: Assets.lock
              ),

              SizedBox(height: 20.h,),
              Button(
                onClick: () => Get.toNamed(Routes.signInScreen),
                text: Strings.signUp.tr,
              ),

              SizedBox(height: 20.h,),
              LoginDivider(text: Strings.orContinueWith.tr),

              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallLoginButton(
                      icon: Assets.facebook,
                      onClick: () {

                      }
                  ),
                  SizedBox(width: 15.w,),
                  SmallLoginButton(
                      icon: Assets.google,
                      onClick: () {

                      }
                  ),
                  SizedBox(width: 15.w,),
                  SmallLoginButton(
                      icon: Assets.apple,
                      iconColor: Get.isDarkMode ? AppColors.white : AppColors.black,
                      onClick: () {

                      }
                  ),
                ],
              ),

              SizedBox(height: 20.h,),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: Strings.dontHaveAnAccount.tr,
                      style: AppTextStyles.bodyMediumRegular
                  ),
                  TextSpan(
                    text: '  ${Strings.signIn.tr}',
                    style: AppTextStyles.bodyMediumSemiBold?.copyWith(
                        color: AppColors.primaryColor
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.offAndToNamed(Routes.homeScreen),
                  ),
                ]),
              ),
            ],
          ),
        )
    );
  }
}