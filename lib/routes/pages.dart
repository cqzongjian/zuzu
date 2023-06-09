/*
* @author: zongjian
* @createTime: 2023/5/26 11:55
* @description: 
*/
import 'package:get/get.dart';
import 'routes.dart';

import '../binding/splash_binding.dart';
import '../views/splash_screen.dart';
import '../views/on_boarding_screen.dart';
import '../views/login/login_screen.dart';
import '../views/lets_in/lets_in_screen.dart';

class Pages {
  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onBoardingScreen,
      page: () => OnBoardingScreen(),
    ),
    GetPage(
      name: Routes.letsInScreen,
      page: () => LetsInScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
    ),
  ];
}