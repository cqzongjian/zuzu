/*
* @author: zongjian
* @createTime: 2023/5/26 11:55
* @description: 
*/
import 'package:get/get.dart';
import 'package:zuzu/binding/index_binding.dart';
import 'routes.dart';

import '../binding/splash_binding.dart';
import '../views/splash_screen.dart';
import '../views/on_boarding_screen.dart';
import '../views/lets_in/lets_in_screen.dart';
import '../views/lets_in/sign_in_screen.dart';
import '../views/lets_in/sign_up_screen.dart';
import '../views/reset_password/select_methods_screen.dart';
import '../views/reset_password/type_otp_screen.dart';
import '../views/reset_password/create_password_screen.dart';
import '../views/index/index_screen.dart';

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
      name: Routes.signInScreen,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: Routes.selectMethodsScreen,
      page: () => SelectMethodsScreen(),
    ),
    GetPage(
      name: Routes.typeOTPScreen,
      page: () => TypeOTPScreen(),
    ),
    GetPage(
      name: Routes.createPasswordScreen,
      page: () => CreatePasswordScreen(),
    ),
    GetPage(
      name: Routes.indexScreen,
      page: () => const IndexScreen(),
      bindings: [
        IndexBinding(),
      ],
    ),
  ];
}