/*
* @author: zongjian
* @createTime: 2023/6/15 14:50
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:zuzu/controller/profile_controller.dart';
import 'package:zuzu/views/profile/widgets/tab_page.dart';

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: ProfileController.to.tabController,
      children: ProfileController.to.sorts.map(
            (e) {
          return TabPage(
            e.id,
            key: Key('${e.id}'),
          );
        },
      ).toList(),
    );
  }
}