/*
* @author: zongjian
* @createTime: 2023/6/14 09:32
* @description:
*/
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zuzu/themes/app_colors.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView(this.controller, {Key? key}) : super(key: key);

  final VideoPlayerController controller;

  @override
  VideoPlayerViewState createState() => VideoPlayerViewState();
}

class VideoPlayerViewState extends State<VideoPlayerView> {
  double defaultAspectRatio = 1;

  VideoPlayerController get controller => widget.controller;

  double get aspectRatio => controller.value.aspectRatio;

  bool get isInitialized => controller.value.isInitialized;

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
    final isNotEqual = defaultAspectRatio != aspectRatio;

    if (isInitialized && isNotEqual) {
      defaultAspectRatio = aspectRatio;

      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return isInitialized ? _buildVideo() : _buildSpinkit();
  }

  Widget _buildVideo() {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        final double boxAspectRatio = constraints.maxWidth / constraints.maxHeight;

        double scale = 1;

        if (aspectRatio < 0.6) {
          scale = max(aspectRatio / boxAspectRatio, boxAspectRatio / aspectRatio);
        }

        return Transform.scale(
          scale: scale,
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: VideoPlayer(controller),
          ),
        );
      },
    );
  }

  Widget _buildSpinkit() {
    return SpinKitCircle(
      size: 60.sp,
      color: AppColors.primaryColor,
    );
  }
}
