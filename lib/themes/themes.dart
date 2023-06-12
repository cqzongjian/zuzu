/*
* @author: zongjian
* @createTime: 2023/5/26 14:10
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class Themes {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  bool _loadThemeFromBox() => _box.read(_key) ?? true;

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  static final light = ThemeData.light().copyWith(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.white,
    indicatorColor: AppColors.greyscale300,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      background: AppColors.white,
      secondary: AppColors.secondaryColor,
      onPrimary: AppColors.greyscale900,
      primaryContainer: AppColors.white,
      onSecondary: AppColors.greyscale200
    ),
    // cardColor: CustomColor.secondaryColor,

    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        color: AppColors.white,
        iconTheme: IconThemeData(
            color: AppColors.dark1
        )
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: AppColors.dark1,
      fontFamily: GoogleFonts.inter().fontFamily,
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.dark1,
    indicatorColor: AppColors.dark3,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      background: AppColors.dark1,
      secondary: AppColors.secondaryColor,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.dark2,
      onSecondary: AppColors.dark3
    ),
    // cardColor: CustomColor.accentColor,

    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
        color: AppColors.dark1,
        iconTheme: IconThemeData(
            color: AppColors.white
        )
    ),
    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: AppColors.white,
      fontFamily: GoogleFonts.urbanist().fontFamily,
    ),
  );
}