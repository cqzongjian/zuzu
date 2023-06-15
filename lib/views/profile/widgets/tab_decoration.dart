/*
* @author: zongjian
* @createTime: 2023/6/15 11:13
* @description:
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zuzu/themes/app_colors.dart';

class TabDecoration extends Decoration {
  const TabDecoration();

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return TabBoxPainter();
  }
}

class TabBoxPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final size = configuration.size;

    canvas.translate(offset.dx + size!.width / 2, size.height);

    final Paint paint = Paint()..color = AppColors.primaryColor;

    final Rect rect = Rect.fromCenter(
      center: Offset.zero,
      width: 36.w,
      height: 6.h,
    );

    canvas.drawRRect(RRect.fromRectXY(rect, 2, 2), paint);
  }
}
