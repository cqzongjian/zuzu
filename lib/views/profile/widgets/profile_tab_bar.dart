/*
* @author: zongjian
* @createTime: 2023/6/15 14:48
* @description: 
*/
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zuzu/controller/profile_controller.dart';
import 'package:zuzu/controller/profile_tab_controller.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/views/profile/widgets/tab_decoration.dart';
import 'package:zuzu/widgets/app_image.dart';
import 'package:zuzu/widgets/app_tag.dart';
import 'package:zuzu/widgets/custom_sliver_persistent_header_delegate.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: CustomSliverPersistentHeaderDelegate(//有最大和最小高度
        maxHeight: 50.h,
        minHeight: 50.h,
        child: GetBuilder<ProfileController>(
            tag: AppTag.tag,
            id: ProfileController.updateSort,
            builder: (s) {
              return Container(
                height: 50.h,
                color: Theme.of(context).colorScheme.background,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: TabBar(
                  isScrollable: false,
                  indicator: const TabDecoration(),
                  controller: s.tabController,
                  labelPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 0),
                  labelColor: AppColors.primaryColor,
                  unselectedLabelColor: AppColors.greyscale700,
                  dividerColor: AppColors.greyscale700,
                  tabs: s.sorts.map((e) {
                    int i = s.sorts.indexWhere((item) => item.id == e.id);
                    return Tab(
                      icon: AppImage(e.icon,
                        width: 24,
                        color: s.tabController?.index == i ? AppColors.primaryColor : AppColors.greyscale700,
                      ),
                    );
                  }).toList(),
                  onTap: (i) {
                    s.setTabIndex(i);
                    Get.put<ProfileTabController>(ProfileTabController(
                        s.sorts[i].id), tag: 'tab-${s.sorts[i].id}');
                  },
                ),
              );
            }
        ),
      ),
    );
  }
}