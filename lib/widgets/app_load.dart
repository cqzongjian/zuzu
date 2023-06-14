/*
* @author: zongjian
* @createTime: 2023/6/14 10:32
* @description:
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zuzu/themes/app_colors.dart';
import 'package:zuzu/themes/app_text_styles.dart';


enum AppLoadType {
  load,
  error,
  success,
}

class AppLoad extends StatelessWidget {
  const AppLoad({
    Key? key,
    this.child,
    this.reload,
    this.margin,
    this.builder,
    this.type = AppLoadType.load,
  }) : super(key: key);

  final Widget? child;
  final AppLoadType type;
  final void Function()? reload;
  final Widget Function()? builder;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppLoadType.load:
        return _buildLoad();
      case AppLoadType.error:
        return _buildError();
      default:
        return _buildSuccess();
    }
  }

  Widget _buildLoad() {
    return LayoutBuilder(
      builder: (_, size) {
        return Container(
          alignment: Alignment.topCenter,
          margin: margin ?? EdgeInsets.only(top: size.maxHeight * 0.4),
          child: UnconstrainedBox(
            child: SpinKitCircle(
              size: 60.sp,
              color: AppColors.primaryColor,
            ),
          ),
        );
      },
    );
  }

  Widget _buildError() {
    return LayoutBuilder(
      builder: (_, size) {
        return Container(
          alignment: Alignment.topCenter,
          margin: margin ?? EdgeInsets.only(top: size.maxHeight * 0.4),
          child: TextButton(
            onPressed: reload,
            child: Text(
              '加载失败，点击重试',
              style: AppTextStyles.bodyLargeBold,
            ),
          ),
        );
      },
    );
  }

  Widget _buildSuccess() {
    if (builder != null) {
      return builder!();
    } else {
      return child ?? const SizedBox();
    }
  }
}
