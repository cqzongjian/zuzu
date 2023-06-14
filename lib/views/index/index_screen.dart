/*
* @author: zongjian
* @createTime: 2023/6/14 09:20
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuzu/controller/index_controller.dart';
import 'package:zuzu/widgets/app_tag.dart';

class IndexScreen extends StatelessWidget {

  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: IndexController.to.exitVerify,
      child: GetBuilder<IndexController>(
        tag: AppTag.tag,
        id: IndexController.updateIndex,
        builder: (s) {
          return IndexedStack(
            index: s.tabIndex,
            children: [
              s.page0,
              s.page1,
              s.page2,
              s.page3,
            ],
          );
        },
      ),
    );
  }
}