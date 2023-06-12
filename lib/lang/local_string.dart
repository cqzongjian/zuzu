/*
* @author: zongjian
* @createTime: 2023/5/26 14:46
* @description: 
*/
import 'package:get/get.dart';
import 'package:zuzu/utils/strings.dart';
import 'chinese.dart';
import 'english.dart';

class LocalString extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN': {
      Strings.appName: Chinese.appName,
      Strings.onBoardingText1: Chinese.onBoardingText1,
      Strings.onBoardingText2: Chinese.onBoardingText2,
      Strings.onBoardingText3: Chinese.onBoardingText3,
      Strings.next: Chinese.next,
      Strings.getStarted: Chinese.getStarted,
      Strings.letsIn: Chinese.letsIn,
      Strings.continueWithFacebook: Chinese.continueWithFacebook,
      Strings.continueWithGoogle: Chinese.continueWithGoogle,
      Strings.continueWithApple: Chinese.continueWithApple,
      Strings.signInWithPassword: Chinese.signInWithPassword,
      Strings.dontHaveAnAccount: Chinese.dontHaveAnAccount,
      Strings.signUp: Chinese.signUp,
      Strings.createYourAccount: Chinese.createYourAccount,
      Strings.loginToYourAccount: Chinese.loginToYourAccount,
      Strings.email: Chinese.email,
      Strings.password: Chinese.password,
      Strings.rememberMe: Chinese.rememberMe,
      Strings.orContinueWith: Chinese.orContinueWith,
      Strings.alreadyHaveAnAccount: Chinese.alreadyHaveAnAccount,
      Strings.forgotThePassword: Chinese.forgotThePassword,
    },
    'en_US': {
      Strings.appName: English.appName,
      Strings.onBoardingText1: English.onBoardingText1,
      Strings.onBoardingText2: English.onBoardingText2,
      Strings.onBoardingText3: English.onBoardingText3,
      Strings.next: English.next,
      Strings.getStarted: English.getStarted,
      Strings.letsIn: English.letsIn,
      Strings.continueWithFacebook: English.continueWithFacebook,
      Strings.continueWithGoogle: English.continueWithGoogle,
      Strings.continueWithApple: English.continueWithApple,
      Strings.signInWithPassword: English.signInWithPassword,
      Strings.dontHaveAnAccount: English.dontHaveAnAccount,
      Strings.signUp: English.signUp,
      Strings.createYourAccount: English.createYourAccount,
      Strings.loginToYourAccount: English.loginToYourAccount,
      Strings.email: English.email,
      Strings.password: English.password,
      Strings.rememberMe: English.rememberMe,
      Strings.orContinueWith: English.orContinueWith,
      Strings.alreadyHaveAnAccount: English.alreadyHaveAnAccount,
      Strings.forgotThePassword: English.forgotThePassword,
    }
  };

}
