/*
* @author: zongjian
* @createTime: 2023/5/26 11:49
* @description:
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h,),
            SvgPicture.asset(
              Assets.logoSVG,
              width: 160.w
            ),
            SizedBox(height: 100.h,),
            SpinKitCircle(
              color: Theme.of(context).primaryColor,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}