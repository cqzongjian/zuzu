/*
* @author: zongjian
* @createTime: 2023/6/14 17:13
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/widgets/app_image.dart';

class RotateCDWidget extends StatefulWidget {
  const RotateCDWidget({super.key});

  @override
  _RotateCDWidgetState createState() => _RotateCDWidgetState();
}

class _RotateCDWidgetState extends State<RotateCDWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // 调整旋转的速度
    )..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0; // 调整动画速度（用于调试目的）

    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _animation.value * 2.0 * 3.14159, // 根据动画值计算旋转角度（弧度）
          child: Image.asset("assets/icons/cd.png", width: 24.0, height: 24.0,),
        );
      },
    );
  }
}
