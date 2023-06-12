/*
* @author: zongjian
* @createTime: 2023/6/12 13:43
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/utils/strings.dart';

class SmallLoginButton extends StatelessWidget {
  final String icon;
  final VoidCallback onClick;
  final Color? iconColor;

  const SmallLoginButton({
    super.key,
    required this.icon,
    required this.onClick,
    this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
        borderRadius: BorderRadius.circular(16.sp)
      ),
      child: InkWell(
        onTap: onClick,
        child: SvgPicture.asset(
            icon,
            colorFilter: iconColor != null ?
              ColorFilter.mode(iconColor!, BlendMode.srcIn) : null,
            width: 24.w
        ),
      ),
    );
  }
}