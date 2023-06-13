/*
* @author: zongjian
* @createTime: 2023/6/13 14:11
* @description: 
*/
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
import 'package:zuzu/widgets/appbar_widget.dart';
import 'package:zuzu/widgets/button.dart';
import 'package:zuzu/widgets/congratulation_dialog_widget.dart';
import 'package:zuzu/widgets/text_input.dart';

class CreatePasswordScreen extends StatelessWidget {
  CreatePasswordScreen({Key? key}) : super(key: key);

  final controller = Get.put(LetsInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          appTitle: Strings.createNewPassword.tr
        ),
        body: Padding(
          padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 20.h,),
                  SvgPicture.asset(
                    Assets.createNewPassword,
                    width: 360,
                    height: 257,
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      Text(Strings.createYourNewPassword.tr, style: AppTextStyles.bodyXLargeMedium,),
                    ],
                  ),

                  SizedBox(height: 15.h,),
                  TextInput(
                      controller: controller.passwordController,
                      hint: Strings.password.tr,
                      icon: Assets.lock,
                      obscureText: true
                  ),
                  SizedBox(height: 15.h,),
                  TextInput(
                      controller: controller.passwordController,
                      hint: Strings.password.tr,
                      icon: Assets.lock,
                      obscureText: true
                  ),
                ],
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Button(
                    onClick: () {
                      showDialog(
                        context: context,
                        barrierColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return CongratulationDialogWidget(
                            icon: Assets.createPassword,
                            title: Strings.congratulations.tr,
                            message: Strings.yourAccountIsReadyToUse.tr,
                          );
                        },
                      );
                    },
                    text: Strings.continueStr.tr,
                  ),
                ),
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
        colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
        width: 32.w
    ),
  );

  Widget _buildCard() => GestureDetector(
    onTap: () {},
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