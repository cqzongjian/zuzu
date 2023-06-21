/*
* @overview: 全局-用户状态
* @Author: zongjian
* @Date: 2023-06-17 21:28:36
*/

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zuzu/controller/base/app_getx_controller.dart';
import 'package:zuzu/http/index.dart';
import 'package:zuzu/model/user_model.dart';
import 'package:zuzu/widgets/app_report.dart';

class AppUserController extends AppGetxController {
  static AppUserController get to => Get.find<AppUserController>();

  static const int updateUserInfo = 1;
  static const int updateLoginStatus = 2;

  /// 是否登录
  bool isLogin = false;

  /// 用户信息
  UserData userData = UserData.init();

  /// 用户ID
  String get uid => userData.id;

  /// 用户头像
  String get avatar => userData.avatar;

  /// 用户昵称
  String get nickname => userData.nickname;

  /// 金币
  int get gold => userData.gold;

  /// 邀请用户数量
  int get inviteCount => userData.codeCount;

  /// 邀请码
  String get inviteCode => userData.refcode;

  /// 用户点赞数
  String get likeCount => userData.myLikeCount;

  /// 用户点赞数
  int get collectCount => userData.collectCount;

  /// 用户登录
  // Future<bool> login() async {
  //   const String url = '/LRUsersDevice';
  //
  //   try {
  //     ClipboardData? text = await Clipboard.getData(Clipboard.kTextPlain);
  //
  //     final Map<String, dynamic> data = {
  //       'deviceCode': await AppDeviceInfo.getDeviceId(),
  //     };
  //     if (text?.text?.isNotEmpty??false) {
  //       data['refCode'] = text!.text;
  //     }
  //
  //     final Map<String, dynamic> json = await RcHttp.post(
  //       url,
  //       data: data,
  //       cancelToken: cancelToken,
  //     );
  //
  //     final LoginModel res = LoginModel.fromJson(json);
  //
  //     if (res.message.code == '200') {
  //       await RcStorage.setValue(RcStorageKey.token, res.data!.token);
  //
  //       getUserInfo();
  //       switchLoginStatus(true);
  //
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e, t) {
  //     AppReport.modelError(
  //       url: url,
  //       e: e,
  //       t: t,
  //     );
  //     return false;
  //   }
  // }

  /// 获取用户信息
  Future<void> getUserInfo({String? userId}) async {
    const String url = '/userInfo/query';

    try {
      final Map<String, dynamic> json = await AppHttp.get(
        url,
        params: {
          "userId": userId
        },
        cancelToken: cancelToken,
      );

      final UserModel res = UserModel.fromJson(json);

      if (res.message.code == 200) {
        userData = res.data;

        update([updateUserInfo]);
      }
    } catch (e, t) {
      AppReport.modelError(
        url: url,
        e: e,
        t: t,
      );
    }
  }

  /// 切换登录状态
  // void switchLoginStatus(bool status) {
  //   if (isLogin == status) return;
  //
  //   if (!status) {
  //     AppStorage.remove(AppStorageKey.token);
  //   }
  //
  //   isLogin = status;
  //   update([updateLoginStatus]);
  // }
}
