/*
* @author: zongjian
* @createTime: 2023/5/26 14:26
* @description: 
*/
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'dimensions.dart';
import 'typography.dart';

class AppTextStyles {

  // static var primaryTextStyle = TextStyle(
  //   color: AppColors.primaryColor,
  //   fontSize: Dimensions.defaultTextSize,
  //   fontWeight: FontWeight.w600,
  // );

  static var heading1 = textTheme.headlineLarge?.copyWith(
    fontSize: 48
  );
  static var heading2 = textTheme.headlineLarge?.copyWith(
    fontSize: 40
  );
  static var heading3 = textTheme.headlineLarge?.copyWith(
    fontSize: 32
  );
  static var heading4 = textTheme.headlineLarge?.copyWith(
    fontSize: 24
  );
  static var heading5 = textTheme.headlineLarge?.copyWith(
    fontSize: 20
  );
  static var heading6 = textTheme.headlineLarge?.copyWith(
    fontSize: 18
  );

  static var bodyXLargeBold = textTheme.bodyLarge?.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w700
  );
  static var bodyXLargeSemiBold = textTheme.bodyLarge?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600
  );
  static var bodyXLargeMedium = textTheme.bodyLarge?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500
  );
  static var bodyXLargeRegular = textTheme.bodyLarge?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w400
  );

  static var bodyLargeBold = textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w700
  );
  static var bodyLargeSemiBold = textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w600
  );
  static var bodyLargeMedium = textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w500
  );
  static var bodyLargeRegular = textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w400
  );

  static var bodyMediumBold = textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w700
  );
  static var bodyMediumSemiBold = textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600
  );
  static var bodyMediumMedium = textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w500
  );
  static var bodyMediumRegular = textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w400
  );

  static var bodySmallBold = textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.w700
  );
  static var bodySmallSemiBold = textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.w600
  );
  static var bodySmallMedium = textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.w500
  );
  static var bodySmallRegular = textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.w400
  );

  static var bodyXSmallBold = textTheme.bodySmall?.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w700
  );
  static var bodyXSmallSemiBold = textTheme.bodySmall?.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w600
  );
  static var bodyXSmallMedium = textTheme.bodySmall?.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500
  );
  static var bodyXSmallRegular = textTheme.bodySmall?.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w400
  );
}