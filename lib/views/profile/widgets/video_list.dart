/*
* @author: zongjian
* @createTime: 2023/6/15 13:47
* @description: 
*/
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zuzu/controller/base/app_getx_controller.dart';
import 'package:zuzu/controller/profile_tab_controller.dart';
import 'package:zuzu/themes/dimensions.dart';
import 'package:zuzu/widgets/app_grid_view.dart';
import 'package:zuzu/widgets/app_load.dart';
import 'package:zuzu/widgets/video_cover.dart';

class VideoList extends StatelessWidget {
  const VideoList(this.id, this.tag, {Key? key}) : super(key: key);

  final int id;
  final String tag;

  @override
  Widget build(BuildContext context) {
    // final s = Get.find<HomeTabController>(tag: tag);
    return GetBuilder<ProfileTabController>(
      id: GetxIds.load,
      tag: tag,
      builder: (s) {
        // final s = Get.find<HomeTabController>(tag: tag);
        return AppLoad(
          type: s.loadType,
          reload: s.reload,
          child: AppGridView(
            controller: s.refreshController,
            padding: EdgeInsets.all(15.w),
            itemCount: s.list.length,
            crossAxisCount: 3,
            mainAxisSpacing: 10.w,
            crossAxisSpacing: 10.w,
            childAspectRatio: 122 / 200,
            itemBuilder: (_, index) {
              final data = s.list[index];

              return VideoCover(
                id: data.id,
                cover: data.thumb,
                videoUrl: data.videoUrl,
                count: data.collect.toString(),
              );
            },
            onLoad: () => s.getList(isRefresh: false),
            onRefresh: () => s.getList(isRefresh: true),
          ),
        );
      },
    );
  }
}
