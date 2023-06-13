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
      Strings.signIn: Chinese.signIn,
      Strings.createYourAccount: Chinese.createYourAccount,
      Strings.loginToYourAccount: Chinese.loginToYourAccount,
      Strings.email: Chinese.email,
      Strings.password: Chinese.password,
      Strings.rememberMe: Chinese.rememberMe,
      Strings.orContinueWith: Chinese.orContinueWith,
      Strings.alreadyHaveAnAccount: Chinese.alreadyHaveAnAccount,
      Strings.forgotThePassword: Chinese.forgotThePassword,
      Strings.selectResetMethods: Chinese.selectResetMethods,
      Strings.continueStr: Chinese.continueStr,
      Strings.viaSMS: Chinese.viaSMS,
      Strings.viaEmail: Chinese.viaEmail,
      Strings.forgotPassword: Chinese.forgotPassword,
      Strings.codeHasBeenSendTo: Chinese.codeHasBeenSendTo,
      Strings.resendCodeIn: Chinese.resendCodeIn,
      Strings.verify: Chinese.verify,
      Strings.createNewPassword: Chinese.createNewPassword,
      Strings.createYourNewPassword: Chinese.createYourNewPassword,
      Strings.congratulations: Chinese.congratulations,
      Strings.yourAccountIsReadyToUse: Chinese.yourAccountIsReadyToUse,
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
      Strings.signIn: English.signIn,
      Strings.createYourAccount: English.createYourAccount,
      Strings.loginToYourAccount: English.loginToYourAccount,
      Strings.email: English.email,
      Strings.password: English.password,
      Strings.rememberMe: English.rememberMe,
      Strings.orContinueWith: English.orContinueWith,
      Strings.alreadyHaveAnAccount: English.alreadyHaveAnAccount,
      Strings.forgotThePassword: English.forgotThePassword,
      Strings.selectResetMethods: English.selectResetMethods,
      Strings.continueStr: English.continueStr,
      Strings.viaSMS: English.viaSMS,
      Strings.viaEmail: English.viaEmail,
      Strings.forgotPassword: English.forgotPassword,
      Strings.codeHasBeenSendTo: English.codeHasBeenSendTo,
      Strings.resendCodeIn: English.resendCodeIn,
      Strings.verify: English.verify,
      Strings.createNewPassword: English.createNewPassword,
      Strings.createYourNewPassword: English.createYourNewPassword,
      Strings.congratulations: English.congratulations,
      Strings.yourAccountIsReadyToUse: English.yourAccountIsReadyToUse,
    }
  };

}
