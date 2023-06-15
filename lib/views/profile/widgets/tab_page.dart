/*
* @author: zongjian
* @createTime: 2023/6/15 11:13
* @description: 
*/
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zuzu/controller/profile_tab_controller.dart';
import 'video_list.dart';

class TabPage extends StatefulWidget {
  const TabPage(this.id, {Key? key}) : super(key: key);

  final int id;

  @override
  TabPageState createState() => TabPageState();
}

class TabPageState extends State<TabPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  String get tag => 'tab-${widget.id}';

  @override
  void initState() {
    super.initState();
    Get.lazyPut<ProfileTabController>(() => ProfileTabController(widget.id), tag: tag);

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return VideoList(widget.id, tag);
  }
}
