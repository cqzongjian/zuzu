/*
* @author: zongjian
* @createTime: 2023/6/15 10:58
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuzu/controller/base/app_getx_controller.dart';
import 'package:zuzu/model/sort_model.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/widgets/app_tag.dart';

class ProfileController extends AppGetxController with GetSingleTickerProviderStateMixin {

  static ProfileController get to => Get.find<ProfileController>(tag: AppTag.tag);

  static const int updateSort = 1;

  TabController? tabController;
  int tabIndex = 0;
  List<SortData> sorts = [
    SortData(id: 0, name: "Category", icon: Assets.category),
    SortData(id: 1, name: "Lock", icon: Assets.lock),
    SortData(id: 2, name: "Bookmark", icon: Assets.bookmark),
    SortData(id: 3, name: "Heart", icon: Assets.heart),
  ];

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: sorts.length, vsync: this);
  }

  @override
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }

  setTabIndex(int i) {
    tabIndex = i;
    update([updateSort]);
  }


}