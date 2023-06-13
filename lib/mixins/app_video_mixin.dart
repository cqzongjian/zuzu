/*
* @author: zongjian
* @createTime: 2023/5/26 11:55
* @description: Video list controller
*/
import 'package:video_player/video_player.dart';

mixin AppVideoControllerMixin {
  /// 预加载数量
  final preloadCount = 2;

  /// 视频列表
  List<VideoUrl> get urls;

  /// 控制器列表
  final Map<String, VideoPlayerController> controllers = {};

  /// 初始化视频播放器
  Future<void> initVideoController() async {
    await createControllerAtIndex(0);

    /// Play 1st video
    playControllerAtIndex(0);

    /// Initialize 2nd vide
    createControllerAtIndex(1);
  }

  /// 播放下一个
  void playNext(int index) {
    /// 暂停 [index - 1]
    pauseControllerAtIndex(index - 1);

    /// 注销 [index - n]
    List.generate(preloadCount, (val) => disposeControllerAtIndex(index - (val + 2)));

    /// 播放 [index]
    playControllerAtIndex(index);

    /// 创建 [index + n]
    List.generate(preloadCount, (val) => createControllerAtIndex(val + 1 + index));
  }

  /// 播放上一个
  void playPrevious(int index) {
    /// 暂停 [index + 1]
    pauseControllerAtIndex(index + 1);

    /// 注销 [index + n]
    List.generate(preloadCount, (val) => disposeControllerAtIndex(index + (val + 2)));

    /// 播放 [index]
    playControllerAtIndex(index);

    /// 创建 [index - n]
    List.generate(preloadCount, (val) => createControllerAtIndex(index - (val + 1)));
  }

  /// 创建-索引-视频播放器
  Future<void> createControllerAtIndex(int index) async {
    if (isIncludeIndex(index)) {
      final key = createControllerKey(index);

      /// 防止重复创建控制器
      if (controllers.containsKey(key)) return;

      final controller = VideoPlayerController.network(urls[index].url);

      controller.setLooping(true);
      controllers[key] = controller;

      await controller.initialize();
    }
  }

  /// 播放-索引-视频播放器
  void playControllerAtIndex(int index) {
    if (isIncludeIndex(index)) {
      final key = createControllerKey(index);

      controllers[key]?.play();
    }
  }

  /// 暂停-索引-视频播放器
  void pauseControllerAtIndex(int index, [bool isReset = true]) {
    if (isIncludeIndex(index)) {
      final key = createControllerKey(index);

      controllers[key]?.pause();
      if (isReset) {
        controllers[key]?.seekTo(Duration.zero);
      }
    }
  }

  /// 注销-索引-视频播放器
  Future<void> disposeControllerAtIndex(int index) async {
    if (isIncludeIndex(index)) {
      final key = createControllerKey(index);

      /// 防止注销空控制器
      if (!controllers.containsKey(key)) return;

      final controller = controllers[key];

      await controller?.pause();
      await controller?.dispose();

      controllers.remove(key);
    }
  }

  /// 是否包含索引
  bool isIncludeIndex(int index) {
    return urls.asMap().keys.contains(index);
  }

  /// 创建控制器Key
  String createControllerKey(int index) {
    String key = '';

    if (isIncludeIndex(index)) {
      key = '$index-id:${urls[index].id}';
    }

    return key;
  }

  /// 暂停所有控制器
  void pauseAllController() {
    controllers.forEach((key, value) {
      value.pause();
    });
  }

  /// 释放所有控制器
  void releaseAllController() {
    controllers.forEach((key, value) {
      value
        ..pause()
        ..dispose();
    });
  }

  /// 获取指定控制器
  VideoPlayerController singleController({
    required int id,
    required int index,
  }) {
    final String key = '$index-id:$id';

    return controllers[key]!;
  }
}

class VideoUrl {
  const VideoUrl({
    required this.id,
    required this.url,
  });

  final int id;
  final String url;
}
