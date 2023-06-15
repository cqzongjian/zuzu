/*
* @author: zongjian
* @createTime: 2023/6/15 09:29
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:zuzu/views/profile/widgets/profile_app_bar.dart';
import 'package:zuzu/views/profile/widgets/profile_tab_bar.dart';
import 'package:zuzu/views/profile/widgets/profile_tab_view.dart';
import 'package:zuzu/views/profile/widgets/profile_user_info.dart';
import 'package:zuzu/widgets/app_bottom_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const ProfileAppBar("Andrew Aisnley"),
            const ProfileUserInfo(),
            const ProfileTabBar(),
          ];
        },
        body: const ProfileTabView(),
      ),
      bottomNavigationBar: const AppBottomBar(),
    );
  }



}