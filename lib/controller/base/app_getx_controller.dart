/*
* @author: zongjian
* @createTime: 2023/6/14 09:21
* @description:
*/
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zuzu/http/index.dart';

import 'package:zuzu/widgets/app_load.dart' show AppLoadType;

enum GetxIds {
  /// 加载状态id
  load,

  /// 点击状态id
  click,
}

class AppGetxController extends GetxController {
  Timer? _timer;
  bool _isClick = true;
  bool _mounted = true;

  CancelToken cancelToken = CancelToken();

  /// 组件加载状态
  AppLoadType loadType = AppLoadType.load;

  /// 控制器是否注销
  bool get mounted => _mounted;

  /// 是否可以点击
  bool get isClick => _isClick;

  /// 是否不可以点击
  bool get isNotClick => !_isClick;

  /// 延迟更新视图
  void delayUpdateView([List<Object>? ids]) {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 200), () {
      _timer?.cancel();
      update(ids);
    });
  }

  /// 设置点击状态
  void setClickStatus(bool val, [List<Object>? ids]) {
    _isClick = val;

    update([GetxIds.click, ...?ids]);
  }

  /// 设置组件加载类型
  void setloadType(AppLoadType type, [List<Object>? ids]) {
    loadType = type;

    update([GetxIds.load, ...?ids]);
  }

  /// 关闭键盘
  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @mustCallSuper
  @override
  void onClose() {
    _mounted = false;
    _timer?.cancel();
    cancelToken.cancel();
    super.onClose();
  }
}
