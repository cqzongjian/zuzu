import 'package:flutter/material.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';
import 'package:zuzu/themes/dimensions.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const Button({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Material(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(Dimensions.radius),
        child: InkWell(
          onTap: onClick,
          child: Center(
            child: Text(
              text,
              style: AppTextStyles.bodyLargeBold,
            ),
          )),
      ),
    );
  }
}
