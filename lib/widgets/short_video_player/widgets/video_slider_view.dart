/*
* @author: zongjian
* @createTime: 2023/6/14 09:32
* @description:
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoSliderView extends StatelessWidget {
  const VideoSliderView(this.controller, {Key? key}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: -3,
      child: VideoProgressIndicator(
        controller,
        allowScrubbing: true,
        padding: EdgeInsets.only(top: 40.h),
        colors: VideoProgressColors(
          playedColor: Colors.white.withOpacity(0.15),
          bufferedColor: Colors.white.withOpacity(0.1),
          backgroundColor: Colors.white.withOpacity(0.05),
        ),
      ),
    );
  }
}
