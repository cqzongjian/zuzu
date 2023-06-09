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
    }
  };

}
