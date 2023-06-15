/*
* @author: zongjian
* @createTime: 2023/6/15 16:07
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/utils/strings.dart';
import 'package:zuzu/widgets/appbar_widget.dart';
import 'package:zuzu/widgets/cell_widget.dart';
import 'package:zuzu/widgets/switch_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        appTitle: "Settings",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CellWidget(icon: Assets.curvedProfile, label: Strings.manageAccount.tr),
            CellWidget(icon: Assets.curvedLock, label: Strings.privacy.tr),
            CellWidget(icon: Assets.curvedShieldDone, label: Strings.security.tr),
            CellWidget(icon: Assets.lightOutlineScan, label: Strings.qrCode.tr),
            CellWidget(icon: Assets.curvedMoreCircle, label: Strings.language.tr, value: 'English (US)',),
            CellWidget(icon: Assets.curvedShow, label: Strings.darkMode.tr,
              child: SwitchWidget(
                width: 44.0,
                height: 24.0,
                toggleSize: 20.0,
                value: 1 == 1,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {

                },
              ),
            ),
            CellWidget(icon: Assets.curvedVideo, label: Strings.contentPreferences.tr),
            CellWidget(icon: Assets.curvedTicketStar, label: Strings.ads.tr),
            CellWidget(icon: Assets.curvedEdit, label: Strings.reportAProblem.tr),
            CellWidget(icon: Assets.curvedInfoSquare, label: Strings.helpCenter.tr),
            CellWidget(icon: Assets.curvedTickSquare, label: Strings.safetyCenter.tr),
            CellWidget(icon: Assets.curved3User, label: Strings.communityGuidelines.tr),
            CellWidget(icon: Assets.curvedPaper, label: Strings.termsOfServices.tr),
            CellWidget(icon: Assets.curvedDangerSquare, label: Strings.privacyPolicy.tr),
            CellWidget(icon: Assets.curvedLogout, label: Strings.logout.tr, color: AppColors.primaryColor,),
          ],
        ),
      ),
    );
  }
}