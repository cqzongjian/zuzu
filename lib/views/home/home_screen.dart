/*
* @author: zongjian
* @createTime: 2023/6/13 17:33
* @description: 
*/
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zuzu/controller/base/app_getx_controller.dart';
import 'package:zuzu/controller/home_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:zuzu/views/home/widgets/top_bar.dart';
import 'package:zuzu/views/home/widgets/video_page.dart';
import 'package:zuzu/widgets/app_bottom_bar.dart';
import 'package:zuzu/widgets/app_load.dart';
import 'package:zuzu/widgets/app_page_view.dart';
import 'package:zuzu/widgets/app_tag.dart';
import 'package:zuzu/widgets/video_scaffold.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  // final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return VideoScaffold(
      controller: HomeController.to.vsCtrl,
      header: const TopBar(),
      enableGesture: true,
      body: VisibilityDetector(
        key: const Key('shortVideo'),
        onVisibilityChanged: HomeController.to.onVisibilityChanged,
        // child: Container(),
        child: GetBuilder<HomeController>(
          tag: AppTag.tag,
          id: GetxIds.load,
          builder: (s) {
            return AppLoad(
              type: s.loadType,
              reload: s.reload,
              child: _buildPageView(),
            );
          },
        ),
      ),
      bottomNavigationBar: const AppBottomBar(),
    );
  }

  Widget _buildPageView() {
    return GetBuilder<HomeController>(
      tag: AppTag.tag,
      id: HomeController.updateList,
      builder: (s) {
        return AppPageView(
          itemCount: s.list.length,
          onPageChanged: s.onPageChanged,
          itemBuilder: (_, int index) {
            final data = s.list[index];
            final controller = s.singleController(id: data.id, index: index);

            return VideoPage(
              index: index,
              controller: controller,
            );
          },
          onRefresh: s.getList,
          onLoad: () => s.getList(isRefresh: false),
        );
      },
    );
  }
}