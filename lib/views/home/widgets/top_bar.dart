/*
* @author: zongjian
* @createTime: 2023/6/14 11:45
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuzu/controller/home_controller.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/widgets/app_image.dart';
import 'package:zuzu/widgets/app_tag.dart';

class TopBar extends StatelessWidget {

  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              child: Container(
                color: Colors.black.withOpacity(0),
                padding: EdgeInsets.all(4),
                alignment: Alignment.centerLeft,
                child: AppImage(
                  Assets.search,
                  width: 28,
                  color: AppColors.white,
                ),
              ),
              onTap: () {},
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.black.withOpacity(0),
              alignment: Alignment.center,
              child: _buildTabs(),
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Container(
                color: Colors.black.withOpacity(0),
                padding: EdgeInsets.all(4),
                alignment: Alignment.centerRight,
                child: AppImage(
                  Assets.live,
                  width: 28,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {

    return GetBuilder<HomeController>(
      tag: AppTag.tag,
      id: HomeController.updateTopBar,
      builder: (s) {
        return Row(
          children: s.topBarList.map((e) => Expanded(
            child: GestureDetector(
              child: Container(
                  child: Container(
                    // padding: EdgeInsets.symmetric(vertical: 12),
                    // color: Colors.black.withOpacity(0),
                    child: Text(
                      e,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyXLargeSemiBold?.copyWith(
                        color: e == s.currentTopBar ? AppColors.primaryColor : AppColors.white
                      ),
                    ),
                  )
              ),
              onTap: () => s.switchTopBar(e),
            ),
          )).toList(),
        );
      }
    );
  }
}