/*
* @author: zongjian
* @createTime: 2023/6/14 09:32
* @description:
*/
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'widgets/video_panel_view.dart';
import 'widgets/video_player_view.dart';
import 'widgets/video_slider_view.dart';

class ShortVideoPlayer extends StatelessWidget {
  const ShortVideoPlayer(this.controller, {Key? key}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: [
          VideoPlayerView(controller),
          VideoPanelView(controller),
          VideoSliderView(controller),
        ],
      ),
    );
  }
}
