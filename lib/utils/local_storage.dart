/*
* @author: zongjian
* @createTime: 2023/5/26 13:55
* @description: 
*/
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const String idKey = "idKey";
const String isOnBoardDoneKey = "isOnBoardDoneKey";
const String tokenKey = "tokenKey";
const String isLoggedInKey = "isLoggedInKey";

const String language = "language";
const String smallLanguage = "smallLanguage";
const String capitalLanguage = "capitalLanguage";
const String themeName = "themeName";

class LocalStorage {
  static Future<void> saveLanguage({
    required String langSmall,
    required String langCap,
    required String languageName,
  }) async {
    final box1 = GetStorage();
    final box2 = GetStorage();
    final box3 = GetStorage();

    var locale = Locale(langSmall, langCap);
    Get.updateLocale(locale);
    await box1.write(smallLanguage, langSmall);
    await box2.write(capitalLanguage, langCap);
    await box3.write(language, languageName);
  }

  static List getLanguage() {
    String small = GetStorage().read(smallLanguage) ?? 'en';
    String capital = GetStorage().read(capitalLanguage) ?? 'US';
    String languages = GetStorage().read(language) ?? 'English';
    return [small, capital, languages];
  }

  static Future<void> saveTheme({
    required int themeStateName,
  }) async {
    final box1 = GetStorage();
    await box1.write(themeName, themeStateName);
  }

  static getThemeState() {
    return GetStorage().read(themeName) ?? 0;
  }

  static Future<void> saveToken({required String token}) async {
    final box = GetStorage();

    await box.write(tokenKey, token);
  }

  static String? getToken() {
    var rtrn = GetStorage().read(tokenKey);

    debugPrint(rtrn == null ? "##Token is null###" : "");

    return rtrn;
  }

  static Future<void> saveId({required String id}) async {
    final box = GetStorage();

    await box.write(idKey, id);
  }

  static String? getId() {
    return GetStorage().read(idKey);
  }

  static Future<void> isLoginSuccess({required bool isLoggedIn}) async {
    final box = GetStorage();

    await box.write(isLoggedInKey, isLoggedIn);
  }

  static bool isLoggedIn() {
    return GetStorage().read(isLoggedInKey) ?? false;
  }

  static Future<void> saveOnboardDoneOrNot(
      {required bool isOnBoardDone}) async {
    final box = GetStorage();

    await box.write(isOnBoardDoneKey, isOnBoardDone);
  }

  static bool isOnBoardDone() {
    return GetStorage().read(isOnBoardDoneKey) ?? false;
  }

  static Future<void> logout() async {
    final FirebaseAuth auth = FirebaseAuth.instance; // firebase instance/object
    auth.signOut();


    final box = GetStorage();

    await box.remove(idKey);

    // await box.remove(nameKey);
    //
    // await box.remove(emailKey);
    //
    // await box.remove(imageKey);

    await box.remove(isLoggedInKey);

    await box.remove(isOnBoardDoneKey);

    // await box.remove(isFreeUserToken);
    //
    // await box.remove(date);
    // await box.remove(imageCount);
    // await box.remove(contentCount);
    // await box.remove(hashTagCount);
    // await box.remove(textCount);
    // await box.remove(isFreeUserKey);
    //
    // await box.remove(isScheduleEmptyKey);
    //
    // await box.remove(subscriptionDate);
  }
}