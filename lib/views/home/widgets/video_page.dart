/*
* @author: zongjian
* @createTime: 2023/6/14 13:34
* @description: 
*/
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:zuzu/controller/home_controller.dart';
import 'package:zuzu/model/video_model.dart';
import 'package:zuzu/widgets/app_tag.dart';
import 'package:zuzu/widgets/short_video_player/index.dart';
import 'package:zuzu/widgets/short_video_right_bar.dart';
import 'package:zuzu/widgets/short_video_title.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  final int index;
  final VideoPlayerController controller;

  String get updateLike => 'like-${data.id}';
  VideoData get data => HomeController.to.list.elementAt(index);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShortVideoPlayer(controller),
        ShortVideoTitle(
          title: data.title,
        ),
        _buildRight(),
      ],
    );
  }

  Widget _buildRight() {
    return GetBuilder<HomeController>(
      tag: AppTag.tag,
      id: HomeController.updateIconAd,
      builder: (s) {
        return GetBuilder<HomeController>(
          tag: AppTag.tag,
          id: updateLike,
          builder: (s) {
            return ShortVideoRightBar(
              // adData: s.adData,
              isLike: data.like,
              shareCount: data.shareNum.toString(),
              likeCount: data.likeNum.toString(),
              likeOnTap: () => s.onLike(index, data.id),
              likeOffTap: () => s.offLike(index, data.id),
              isCollect: data.collect,
              collectNum: data.collectNum.toString(),
              collectTap: () => s.changeCollect(index, data.id),
            );
          },
        );
      },
    );
  }
}
