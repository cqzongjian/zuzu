/*
* @author: zongjian
* @createTime: 2023/6/13 17:34
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:zuzu/mixins/app_video_mixin.dart';
import 'package:zuzu/model/on_boarding_model.dart';
import 'package:zuzu/model/video_model.dart';
import 'package:zuzu/routes/routes.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/utils/strings.dart';
import 'package:zuzu/widgets/on_boarding_widget.dart';

class HomeController extends GetxController with AppVideoControllerMixin, WidgetsBindingObserver  {

  int currentIndex = 0;

  /// 组件是否可见
  bool isVisible = false;

  int page = 1;
  bool isLast = false;
  List<VideoData> list = [];

  int adIndex = 0;
  // List<CarouselData> iconAd = [];

  // CarouselData get adData => iconAd.isNotEmpty ? iconAd[adIndex] : CarouselData.init();

  @override
  List<VideoUrl> get urls => list.map((e) => VideoUrl(id: e.id, url: e.videoUrl)).toList();

  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addObserver(this);

    getList();
    getIconAd();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.inactive:
        setPlayOrPause(false);
        break;
      case AppLifecycleState.resumed:
        setPlayOrPause(true);
        break;
      default:
    }
  }

  @override
  void onClose() {
    releaseAllController();
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  /// 可见变化后-设置播放or暂停
  void setPlayOrPause(bool isPlay) {
    if (isVisible && isPlay) {
      playControllerAtIndex(currentIndex);
    } else {
      pauseControllerAtIndex(currentIndex, false);
    }
  }

  /// 页面显示监听
  void onVisibilityChanged(VisibilityInfo info) {
    isVisible = info.visibleFraction == 1;

    setPlayOrPause(true);
  }

  /// 滑动监听
  void onPageChanged(int index) {
    // final previousIndex = currentIndex;
    // currentIndex = index;
    //
    // if (currentIndex > previousIndex) {
    //   playNext(index);
    // } else {
    //   playPrevious(index);
    // }
    //
    // playRecord();
    // toggleIconAd();
    // update([updatePageIndex]);
  }

  Future<void> reload() async {
    // setloadType(AppLoadType.load);

    // await Future.delayed(const Duration(milliseconds: 300));
    //
    // getList();
    // getIconAd();
  }

  Future<void> getList({bool isRefresh = true}) async {
    // const String url = '/videoInfoRandom';
    //
    // if (isRefresh) {
    //   page = 1;
    //   isLast = false;
    // }
    //
    // try {
    //   final Map<String, dynamic> data = {
    //     'page': page,
    //     'limit': 20,
    //   };
    //
    //   final Map<String, dynamic> json = await AppHttp.post(
    //     url,
    //     data: data,
    //     cancelToken: cancelToken,
    //   );
    //
    //   print(json);
    //
    //   final VideoModel res = VideoModel.fromJson(json);
    //
    //   if (res.message.code == '200') {
    //     if (isRefresh) {
    //       list = res.data.list;
    //       await initVideoController();
    //     } else {
    //       final latestIndex = list.length;
    //       list.addAll(res.data.list);
    //       await createControllerAtIndex(latestIndex);
    //     }
    //
    //     if (res.data.isLastPage) {
    //       isLast = true;
    //     } else {
    //       page++;
    //     }
    //
    //     if (loadType == AppLoadType.success) {
    //       update([updateList]);
    //     } else {
    //       setloadType(AppLoadType.success);
    //     }
    //   }
    // } catch (e, t) {
    //   setloadType(AppLoadType.error);
    //   RcReport.modelError(
    //     url: url,
    //     e: e,
    //     t: t,
    //   );
    // }
  }

  /// 视频点赞
  Future<void> onLike(int index, int id) async {

  }

  /// 视频取消点赞
  Future<void> offLike(int index, int id) async {

  }

  /// 播放记录上传
  Future<void> playRecord() async {

  }

  /// 获取图标广告
  Future<void> getIconAd() async {

  }

  /// 收藏
  Future<void> changeCollect(int index, int id) async {

  }


}