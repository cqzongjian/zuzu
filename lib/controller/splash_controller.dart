/*
* @author: zongjian
* @createTime: 2023/5/26 11:57
* @description: 
*/
import 'dart:async';
import 'dart:ui';

import 'package:get/get.dart';

import '../routes/routes.dart';
import '../utils/constants.dart';
import '../utils/local_storage.dart';

class SplashController extends GetxController {

  @override
  void onReady() {
    // homeController.getCredentials();
    var languageList = LocalStorage.getLanguage();
    var locale = Locale(languageList[0], languageList[1]);

    languageStateName = languageList[2];

    Get.updateLocale(locale);


    // MainController.getCredentials();

    _goToScreen();

    super.onReady();
  }

  _goToScreen() async {
    Timer(const Duration(seconds: 3), () {
      LocalStorage.isOnBoardDone()
        ? (LocalStorage.isLoggedIn()
          ? Get.offAndToNamed(Routes.indexScreen)
          : Get.offAndToNamed(Routes.letsInScreen))
        : Get.offAndToNamed(Routes.onBoardingScreen);
    });
  }
}