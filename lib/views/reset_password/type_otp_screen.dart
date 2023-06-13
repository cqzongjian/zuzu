/*
* @author: zongjian
* @createTime: 2023/6/13 14:10
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:zuzu/routes/routes.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';
import 'package:zuzu/themes/dimensions.dart';
import 'package:zuzu/utils/strings.dart';
import 'package:zuzu/widgets/appbar_widget.dart';
import 'package:zuzu/widgets/button.dart';

class TypeOTPScreen extends StatelessWidget {
  TypeOTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        appTitle: Strings.forgotPassword.tr
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${Strings.codeHasBeenSendTo} +1 111 ******99", style: AppTextStyles.bodyXLargeMedium,),
                SizedBox(height: 20.h,),
                _buildPinPut(context),
                SizedBox(height: 20.h,),

                Text("${Strings.resendCodeIn} 55s", style: AppTextStyles.bodyXLargeMedium,),
              ],
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Button(
                  onClick: () => Get.toNamed(Routes.createPasswordScreen),
                  text: Strings.verify.tr,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinPut(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 83,
      height: 61,
      textStyle: AppTextStyles.heading4?.copyWith(
        fontWeight: FontWeight.w700
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primaryColor),
      borderRadius: BorderRadius.circular(12),
      color: AppColors.transparentRed.withOpacity(0.08)
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.transparent,
      ),
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        return s == '2222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }
}