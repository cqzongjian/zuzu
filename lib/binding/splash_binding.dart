/*
* @author: zongjian
* @createTime: 2023/5/26 11:57
* @description: 
*/
import 'package:get/get.dart';

import '../controller/splash_controller.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}