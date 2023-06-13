/*
* @author: zongjian
* @createTime: 2023/6/13 17:33
* @description: 
*/
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zuzu/controller/home_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VisibilityDetector(
        key: const Key('shortVideo'),
        onVisibilityChanged: controller.onVisibilityChanged,
        child: Container(),
        // child: GetBuilder<VideoHomeController>(
        //   tag: RcTag.tag,
        //   id: GetxIds.load,
        //   builder: (s) {
        //     return AppLoad(
        //       type: s.loadType,
        //       reload: s.reload,
        //       child: _buildPageView(),
        //     );
        //   },
        // ),
      ),
    );
  }
}