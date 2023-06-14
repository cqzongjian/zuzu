/*
* @author: zongjian
* @createTime: 2023/6/14 09:32
* @description:
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:zuzu/widgets/app_gesture_detector.dart';

class VideoPanelView extends StatefulWidget {
  const VideoPanelView(this.controller, {Key? key}) : super(key: key);

  final VideoPlayerController controller;

  @override
  VideoPanelViewState createState() => VideoPanelViewState();
}

class VideoPanelViewState extends State<VideoPanelView> {
  VideoPlayerController get controller => widget.controller;

  bool get isPlaying => controller.value.isPlaying;

  bool get isInitialized => controller.value.isInitialized;

  bool isShowIcon = false;

  @override
  void initState() {
    super.initState();

    controller.addListener(listener);
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  void listener() {
    if (isInitialized && (isPlaying == isShowIcon)) {
      isShowIcon = !isPlaying;
      if (mounted) setState(() {});
    }
  }

  void onTap() {
    if (isInitialized) {
      isPlaying ? controller.pause() : controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppGestureDetector(
      onTap: onTap,
      child: isShowIcon ? _buildIcon() : null,
    );
  }

  Widget _buildIcon() {
    return SizedBox.expand(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black45,
          ),
          child: Icon(
            Icons.play_arrow,
            size: 64.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
