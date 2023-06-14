/*
* @author: zongjian
* @createTime: 2023/5/26 11:57
* @description: 
*/
import 'package:get/get.dart';
import 'package:zuzu/controller/home_controller.dart';
import 'package:zuzu/widgets/app_tag.dart';

import '../controller/index_controller.dart';


class IndexBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(IndexController());
    Get.put<IndexController>(IndexController(), tag: AppTag.tag);
    Get.put<HomeController>(HomeController(), tag: AppTag.tag);
  }
}