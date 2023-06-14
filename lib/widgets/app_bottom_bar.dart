/*
* @author: zongjian
* @createTime: 2023/6/14 09:32
* @description: 
*/
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zuzu/controller/index_controller.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/utils/strings.dart';
import 'package:zuzu/widgets/app_tag.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  // final ThemeMode themeMode;

  // Color get backgroundColor => themeMode == ThemeMode.light ? Colors.white : Colors.black;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(
      tag: AppTag.tag,
      id: IndexController.updateIndex,
      builder: (s) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: s.tabIndex,
          onTap: s.switchTabBar,
          backgroundColor: Theme.of(context).colorScheme.background,
          unselectedItemColor: AppColors.greyscale500,
          selectedItemColor: AppColors.primaryColor,
          selectedLabelStyle: AppTextStyles.bodyXSmallMedium,
          unselectedLabelStyle: AppTextStyles.bodyXSmallMedium,
          items: const [
            BottomNavigationBarItem(
              label: Strings.home,
              icon: IconWidget(Assets.homeSVG),
              activeIcon: IconWidget(Assets.homeSVG, active: true,),
            ),
            BottomNavigationBarItem(
              label: Strings.discover,
              icon: IconWidget(Assets.discoverySVG),
              activeIcon: IconWidget(Assets.discoverySVG, active: true,),
            ),
            BottomNavigationBarItem(
              label: Strings.inbox,
              icon: IconWidget(Assets.chatSVG),
              activeIcon: IconWidget(Assets.chatSVG, active: true,),
            ),
            BottomNavigationBarItem(
              label: Strings.profile,
              icon: IconWidget(Assets.profileSVG),
              activeIcon: IconWidget(Assets.profileSVG, active: true,),
            ),
          ],
        );
      },
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget(this.iconName, {Key? key, this.active = false}) : super(key: key);

  final String iconName;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconName,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(active ? AppColors.primaryColor : AppColors.greyscale500, BlendMode.srcIn),
    );
  }
}
