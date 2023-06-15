/*
* @author: zongjian
* @createTime: 2023/6/14 09:21
* @description: 
*/
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zuzu/views/discovery/discovery_screen.dart';
import 'package:zuzu/views/home/home_screen.dart';
import 'package:zuzu/views/inbox/inbox_screen.dart';
import 'package:zuzu/views/profile/profile_screen.dart';
import 'package:zuzu/widgets/app_bottom_bar.dart';
import 'package:zuzu/widgets/app_tag.dart';
import 'package:zuzu/widgets/app_toast.dart';

class IndexController extends GetxController {

  static IndexController get to => Get.find<IndexController>(tag: AppTag.tag);

  static const int updateIndex = 1;

  // static const Widget bottomNavigationBar = AppBottomBar();

  final Widget _page0 = HomeScreen();
  final Widget _page1 = DiscoveryScreen();
  final Widget _page2 = InboxScreen();
  final Widget _page3 = ProfileScreen();
  final Widget _placeholder = const SizedBox();

  int tabIndex = 0;
  int lastExitTime = 0;

  bool _showPage0 = true;
  bool _showPage1 = false;
  bool _showPage2 = false;
  bool _showPage3 = false;
  // bool _showPage4 = false;

  Widget get page0 => _showPage0 ? _page0 : _placeholder;
  Widget get page1 => _showPage1 ? _page1 : _placeholder;
  Widget get pageAdd => _placeholder;
  Widget get page2 => _showPage2 ? _page2 : _placeholder;
  Widget get page3 => _showPage3 ? _page3 : _placeholder;
  // Widget get page4 => _showPage4 ? _page4 : _placeholder;

  @override
  void onInit() {
    super.onInit();

    // AppVersionController.to.getVersion();
  }

  void switchTabBar(int index) {
    if (tabIndex == index) return;

    switch (index) {
      case 0:
        _showPage0 = true;
        break;
      case 1:
        _showPage1 = true;
        break;
      case 2:
        break;
      case 3:
        _showPage2 = true;
        break;
      case 4:
        _showPage3 = true;
        // AppUserController.to.getUserInfo();
        break;
      default:
    }

    tabIndex = index;
    update([updateIndex]);
  }

  Future<bool> exitVerify() async {
    final int nowExitTime = DateTime.now().millisecondsSinceEpoch;

    if (nowExitTime - lastExitTime > 1000) {
      lastExitTime = nowExitTime;
      AppToast('再按一次退出');

      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}